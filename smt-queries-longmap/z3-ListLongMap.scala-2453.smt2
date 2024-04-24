; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38522 () Bool)

(assert start!38522)

(declare-fun b!398299 () Bool)

(declare-fun res!228903 () Bool)

(declare-fun e!240746 () Bool)

(assert (=> b!398299 (=> (not res!228903) (not e!240746))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23802 0))(
  ( (array!23803 (arr!11350 (Array (_ BitVec 32) (_ BitVec 64))) (size!11702 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23802)

(assert (=> b!398299 (= res!228903 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11702 _keys!709))))))

(declare-fun b!398300 () Bool)

(declare-fun e!240743 () Bool)

(assert (=> b!398300 (= e!240743 false)))

(declare-fun lt!187464 () Bool)

(declare-fun lt!187463 () array!23802)

(declare-datatypes ((List!6427 0))(
  ( (Nil!6424) (Cons!6423 (h!7279 (_ BitVec 64)) (t!11593 List!6427)) )
))
(declare-fun arrayNoDuplicates!0 (array!23802 (_ BitVec 32) List!6427) Bool)

(assert (=> b!398300 (= lt!187464 (arrayNoDuplicates!0 lt!187463 #b00000000000000000000000000000000 Nil!6424))))

(declare-fun b!398301 () Bool)

(declare-fun res!228899 () Bool)

(assert (=> b!398301 (=> (not res!228899) (not e!240746))))

(assert (=> b!398301 (= res!228899 (or (= (select (arr!11350 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11350 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398303 () Bool)

(declare-fun res!228905 () Bool)

(assert (=> b!398303 (=> (not res!228905) (not e!240746))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398303 (= res!228905 (validMask!0 mask!1025))))

(declare-fun b!398304 () Bool)

(declare-fun e!240748 () Bool)

(declare-fun e!240745 () Bool)

(declare-fun mapRes!16554 () Bool)

(assert (=> b!398304 (= e!240748 (and e!240745 mapRes!16554))))

(declare-fun condMapEmpty!16554 () Bool)

(declare-datatypes ((V!14379 0))(
  ( (V!14380 (val!5022 Int)) )
))
(declare-datatypes ((ValueCell!4634 0))(
  ( (ValueCellFull!4634 (v!7270 V!14379)) (EmptyCell!4634) )
))
(declare-datatypes ((array!23804 0))(
  ( (array!23805 (arr!11351 (Array (_ BitVec 32) ValueCell!4634)) (size!11703 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23804)

(declare-fun mapDefault!16554 () ValueCell!4634)

(assert (=> b!398304 (= condMapEmpty!16554 (= (arr!11351 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4634)) mapDefault!16554)))))

(declare-fun b!398305 () Bool)

(declare-fun res!228904 () Bool)

(assert (=> b!398305 (=> (not res!228904) (not e!240746))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398305 (= res!228904 (and (= (size!11703 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11702 _keys!709) (size!11703 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398306 () Bool)

(declare-fun tp_is_empty!9955 () Bool)

(assert (=> b!398306 (= e!240745 tp_is_empty!9955)))

(declare-fun mapIsEmpty!16554 () Bool)

(assert (=> mapIsEmpty!16554 mapRes!16554))

(declare-fun b!398302 () Bool)

(assert (=> b!398302 (= e!240746 e!240743)))

(declare-fun res!228902 () Bool)

(assert (=> b!398302 (=> (not res!228902) (not e!240743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23802 (_ BitVec 32)) Bool)

(assert (=> b!398302 (= res!228902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187463 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!398302 (= lt!187463 (array!23803 (store (arr!11350 _keys!709) i!563 k0!794) (size!11702 _keys!709)))))

(declare-fun res!228900 () Bool)

(assert (=> start!38522 (=> (not res!228900) (not e!240746))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38522 (= res!228900 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11702 _keys!709))))))

(assert (=> start!38522 e!240746))

(assert (=> start!38522 true))

(declare-fun array_inv!8386 (array!23804) Bool)

(assert (=> start!38522 (and (array_inv!8386 _values!549) e!240748)))

(declare-fun array_inv!8387 (array!23802) Bool)

(assert (=> start!38522 (array_inv!8387 _keys!709)))

(declare-fun b!398307 () Bool)

(declare-fun res!228901 () Bool)

(assert (=> b!398307 (=> (not res!228901) (not e!240746))))

(declare-fun arrayContainsKey!0 (array!23802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398307 (= res!228901 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398308 () Bool)

(declare-fun res!228897 () Bool)

(assert (=> b!398308 (=> (not res!228897) (not e!240746))))

(assert (=> b!398308 (= res!228897 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6424))))

(declare-fun b!398309 () Bool)

(declare-fun res!228898 () Bool)

(assert (=> b!398309 (=> (not res!228898) (not e!240746))))

(assert (=> b!398309 (= res!228898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398310 () Bool)

(declare-fun e!240747 () Bool)

(assert (=> b!398310 (= e!240747 tp_is_empty!9955)))

(declare-fun b!398311 () Bool)

(declare-fun res!228906 () Bool)

(assert (=> b!398311 (=> (not res!228906) (not e!240746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398311 (= res!228906 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16554 () Bool)

(declare-fun tp!32349 () Bool)

(assert (=> mapNonEmpty!16554 (= mapRes!16554 (and tp!32349 e!240747))))

(declare-fun mapKey!16554 () (_ BitVec 32))

(declare-fun mapValue!16554 () ValueCell!4634)

(declare-fun mapRest!16554 () (Array (_ BitVec 32) ValueCell!4634))

(assert (=> mapNonEmpty!16554 (= (arr!11351 _values!549) (store mapRest!16554 mapKey!16554 mapValue!16554))))

(assert (= (and start!38522 res!228900) b!398303))

(assert (= (and b!398303 res!228905) b!398305))

(assert (= (and b!398305 res!228904) b!398309))

(assert (= (and b!398309 res!228898) b!398308))

(assert (= (and b!398308 res!228897) b!398299))

(assert (= (and b!398299 res!228903) b!398311))

(assert (= (and b!398311 res!228906) b!398301))

(assert (= (and b!398301 res!228899) b!398307))

(assert (= (and b!398307 res!228901) b!398302))

(assert (= (and b!398302 res!228902) b!398300))

(assert (= (and b!398304 condMapEmpty!16554) mapIsEmpty!16554))

(assert (= (and b!398304 (not condMapEmpty!16554)) mapNonEmpty!16554))

(get-info :version)

(assert (= (and mapNonEmpty!16554 ((_ is ValueCellFull!4634) mapValue!16554)) b!398310))

(assert (= (and b!398304 ((_ is ValueCellFull!4634) mapDefault!16554)) b!398306))

(assert (= start!38522 b!398304))

(declare-fun m!393477 () Bool)

(assert (=> b!398301 m!393477))

(declare-fun m!393479 () Bool)

(assert (=> b!398303 m!393479))

(declare-fun m!393481 () Bool)

(assert (=> b!398309 m!393481))

(declare-fun m!393483 () Bool)

(assert (=> b!398300 m!393483))

(declare-fun m!393485 () Bool)

(assert (=> b!398308 m!393485))

(declare-fun m!393487 () Bool)

(assert (=> b!398311 m!393487))

(declare-fun m!393489 () Bool)

(assert (=> b!398302 m!393489))

(declare-fun m!393491 () Bool)

(assert (=> b!398302 m!393491))

(declare-fun m!393493 () Bool)

(assert (=> mapNonEmpty!16554 m!393493))

(declare-fun m!393495 () Bool)

(assert (=> start!38522 m!393495))

(declare-fun m!393497 () Bool)

(assert (=> start!38522 m!393497))

(declare-fun m!393499 () Bool)

(assert (=> b!398307 m!393499))

(check-sat (not b!398303) (not mapNonEmpty!16554) tp_is_empty!9955 (not b!398308) (not b!398302) (not b!398300) (not b!398307) (not start!38522) (not b!398309) (not b!398311))
(check-sat)
