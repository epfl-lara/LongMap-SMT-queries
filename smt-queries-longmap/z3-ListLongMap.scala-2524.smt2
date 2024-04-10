; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38964 () Bool)

(assert start!38964)

(declare-fun b!407990 () Bool)

(declare-fun e!244952 () Bool)

(assert (=> b!407990 (= e!244952 false)))

(declare-fun lt!188728 () Bool)

(declare-datatypes ((array!24647 0))(
  ( (array!24648 (arr!11773 (Array (_ BitVec 32) (_ BitVec 64))) (size!12125 (_ BitVec 32))) )
))
(declare-fun lt!188729 () array!24647)

(declare-datatypes ((List!6826 0))(
  ( (Nil!6823) (Cons!6822 (h!7678 (_ BitVec 64)) (t!12000 List!6826)) )
))
(declare-fun arrayNoDuplicates!0 (array!24647 (_ BitVec 32) List!6826) Bool)

(assert (=> b!407990 (= lt!188728 (arrayNoDuplicates!0 lt!188729 #b00000000000000000000000000000000 Nil!6823))))

(declare-fun b!407991 () Bool)

(declare-fun res!235968 () Bool)

(declare-fun e!244951 () Bool)

(assert (=> b!407991 (=> (not res!235968) (not e!244951))))

(declare-fun _keys!709 () array!24647)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407991 (= res!235968 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407992 () Bool)

(declare-fun e!244953 () Bool)

(declare-fun tp_is_empty!10383 () Bool)

(assert (=> b!407992 (= e!244953 tp_is_empty!10383)))

(declare-fun b!407993 () Bool)

(declare-fun res!235977 () Bool)

(assert (=> b!407993 (=> (not res!235977) (not e!244951))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407993 (= res!235977 (or (= (select (arr!11773 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11773 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407994 () Bool)

(assert (=> b!407994 (= e!244951 e!244952)))

(declare-fun res!235975 () Bool)

(assert (=> b!407994 (=> (not res!235975) (not e!244952))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24647 (_ BitVec 32)) Bool)

(assert (=> b!407994 (= res!235975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188729 mask!1025))))

(assert (=> b!407994 (= lt!188729 (array!24648 (store (arr!11773 _keys!709) i!563 k0!794) (size!12125 _keys!709)))))

(declare-fun b!407995 () Bool)

(declare-fun res!235969 () Bool)

(assert (=> b!407995 (=> (not res!235969) (not e!244951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407995 (= res!235969 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17196 () Bool)

(declare-fun mapRes!17196 () Bool)

(assert (=> mapIsEmpty!17196 mapRes!17196))

(declare-fun b!407996 () Bool)

(declare-fun res!235973 () Bool)

(assert (=> b!407996 (=> (not res!235973) (not e!244951))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14949 0))(
  ( (V!14950 (val!5236 Int)) )
))
(declare-datatypes ((ValueCell!4848 0))(
  ( (ValueCellFull!4848 (v!7483 V!14949)) (EmptyCell!4848) )
))
(declare-datatypes ((array!24649 0))(
  ( (array!24650 (arr!11774 (Array (_ BitVec 32) ValueCell!4848)) (size!12126 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24649)

(assert (=> b!407996 (= res!235973 (and (= (size!12126 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12125 _keys!709) (size!12126 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407997 () Bool)

(declare-fun e!244956 () Bool)

(assert (=> b!407997 (= e!244956 (and e!244953 mapRes!17196))))

(declare-fun condMapEmpty!17196 () Bool)

(declare-fun mapDefault!17196 () ValueCell!4848)

(assert (=> b!407997 (= condMapEmpty!17196 (= (arr!11774 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4848)) mapDefault!17196)))))

(declare-fun res!235976 () Bool)

(assert (=> start!38964 (=> (not res!235976) (not e!244951))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38964 (= res!235976 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12125 _keys!709))))))

(assert (=> start!38964 e!244951))

(assert (=> start!38964 true))

(declare-fun array_inv!8588 (array!24649) Bool)

(assert (=> start!38964 (and (array_inv!8588 _values!549) e!244956)))

(declare-fun array_inv!8589 (array!24647) Bool)

(assert (=> start!38964 (array_inv!8589 _keys!709)))

(declare-fun b!407998 () Bool)

(declare-fun res!235970 () Bool)

(assert (=> b!407998 (=> (not res!235970) (not e!244951))))

(assert (=> b!407998 (= res!235970 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12125 _keys!709))))))

(declare-fun b!407999 () Bool)

(declare-fun res!235972 () Bool)

(assert (=> b!407999 (=> (not res!235972) (not e!244951))))

(assert (=> b!407999 (= res!235972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408000 () Bool)

(declare-fun res!235971 () Bool)

(assert (=> b!408000 (=> (not res!235971) (not e!244951))))

(assert (=> b!408000 (= res!235971 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6823))))

(declare-fun b!408001 () Bool)

(declare-fun res!235974 () Bool)

(assert (=> b!408001 (=> (not res!235974) (not e!244951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408001 (= res!235974 (validKeyInArray!0 k0!794))))

(declare-fun b!408002 () Bool)

(declare-fun e!244955 () Bool)

(assert (=> b!408002 (= e!244955 tp_is_empty!10383)))

(declare-fun mapNonEmpty!17196 () Bool)

(declare-fun tp!33315 () Bool)

(assert (=> mapNonEmpty!17196 (= mapRes!17196 (and tp!33315 e!244955))))

(declare-fun mapRest!17196 () (Array (_ BitVec 32) ValueCell!4848))

(declare-fun mapValue!17196 () ValueCell!4848)

(declare-fun mapKey!17196 () (_ BitVec 32))

(assert (=> mapNonEmpty!17196 (= (arr!11774 _values!549) (store mapRest!17196 mapKey!17196 mapValue!17196))))

(assert (= (and start!38964 res!235976) b!407995))

(assert (= (and b!407995 res!235969) b!407996))

(assert (= (and b!407996 res!235973) b!407999))

(assert (= (and b!407999 res!235972) b!408000))

(assert (= (and b!408000 res!235971) b!407998))

(assert (= (and b!407998 res!235970) b!408001))

(assert (= (and b!408001 res!235974) b!407993))

(assert (= (and b!407993 res!235977) b!407991))

(assert (= (and b!407991 res!235968) b!407994))

(assert (= (and b!407994 res!235975) b!407990))

(assert (= (and b!407997 condMapEmpty!17196) mapIsEmpty!17196))

(assert (= (and b!407997 (not condMapEmpty!17196)) mapNonEmpty!17196))

(get-info :version)

(assert (= (and mapNonEmpty!17196 ((_ is ValueCellFull!4848) mapValue!17196)) b!408002))

(assert (= (and b!407997 ((_ is ValueCellFull!4848) mapDefault!17196)) b!407992))

(assert (= start!38964 b!407997))

(declare-fun m!399463 () Bool)

(assert (=> start!38964 m!399463))

(declare-fun m!399465 () Bool)

(assert (=> start!38964 m!399465))

(declare-fun m!399467 () Bool)

(assert (=> b!407994 m!399467))

(declare-fun m!399469 () Bool)

(assert (=> b!407994 m!399469))

(declare-fun m!399471 () Bool)

(assert (=> b!407993 m!399471))

(declare-fun m!399473 () Bool)

(assert (=> b!408000 m!399473))

(declare-fun m!399475 () Bool)

(assert (=> b!407999 m!399475))

(declare-fun m!399477 () Bool)

(assert (=> b!407995 m!399477))

(declare-fun m!399479 () Bool)

(assert (=> b!407991 m!399479))

(declare-fun m!399481 () Bool)

(assert (=> mapNonEmpty!17196 m!399481))

(declare-fun m!399483 () Bool)

(assert (=> b!408001 m!399483))

(declare-fun m!399485 () Bool)

(assert (=> b!407990 m!399485))

(check-sat tp_is_empty!10383 (not b!407990) (not b!407991) (not b!408001) (not b!407999) (not b!407994) (not b!408000) (not b!407995) (not start!38964) (not mapNonEmpty!17196))
(check-sat)
