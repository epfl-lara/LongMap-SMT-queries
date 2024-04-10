; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38352 () Bool)

(assert start!38352)

(declare-fun b!395538 () Bool)

(declare-fun e!239466 () Bool)

(declare-fun tp_is_empty!9819 () Bool)

(assert (=> b!395538 (= e!239466 tp_is_empty!9819)))

(declare-fun b!395539 () Bool)

(declare-fun e!239464 () Bool)

(declare-fun mapRes!16341 () Bool)

(assert (=> b!395539 (= e!239464 (and e!239466 mapRes!16341))))

(declare-fun condMapEmpty!16341 () Bool)

(declare-datatypes ((V!14197 0))(
  ( (V!14198 (val!4954 Int)) )
))
(declare-datatypes ((ValueCell!4566 0))(
  ( (ValueCellFull!4566 (v!7200 V!14197)) (EmptyCell!4566) )
))
(declare-datatypes ((array!23545 0))(
  ( (array!23546 (arr!11225 (Array (_ BitVec 32) ValueCell!4566)) (size!11577 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23545)

(declare-fun mapDefault!16341 () ValueCell!4566)

(assert (=> b!395539 (= condMapEmpty!16341 (= (arr!11225 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4566)) mapDefault!16341)))))

(declare-fun res!226768 () Bool)

(declare-fun e!239467 () Bool)

(assert (=> start!38352 (=> (not res!226768) (not e!239467))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23547 0))(
  ( (array!23548 (arr!11226 (Array (_ BitVec 32) (_ BitVec 64))) (size!11578 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23547)

(assert (=> start!38352 (= res!226768 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11578 _keys!709))))))

(assert (=> start!38352 e!239467))

(assert (=> start!38352 true))

(declare-fun array_inv!8242 (array!23545) Bool)

(assert (=> start!38352 (and (array_inv!8242 _values!549) e!239464)))

(declare-fun array_inv!8243 (array!23547) Bool)

(assert (=> start!38352 (array_inv!8243 _keys!709)))

(declare-fun b!395540 () Bool)

(declare-fun e!239465 () Bool)

(assert (=> b!395540 (= e!239465 tp_is_empty!9819)))

(declare-fun b!395541 () Bool)

(declare-fun res!226769 () Bool)

(assert (=> b!395541 (=> (not res!226769) (not e!239467))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395541 (= res!226769 (validMask!0 mask!1025))))

(declare-fun b!395542 () Bool)

(declare-fun res!226771 () Bool)

(assert (=> b!395542 (=> (not res!226771) (not e!239467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23547 (_ BitVec 32)) Bool)

(assert (=> b!395542 (= res!226771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395543 () Bool)

(declare-fun res!226770 () Bool)

(assert (=> b!395543 (=> (not res!226770) (not e!239467))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395543 (= res!226770 (and (= (size!11577 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11578 _keys!709) (size!11577 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16341 () Bool)

(declare-fun tp!32136 () Bool)

(assert (=> mapNonEmpty!16341 (= mapRes!16341 (and tp!32136 e!239465))))

(declare-fun mapRest!16341 () (Array (_ BitVec 32) ValueCell!4566))

(declare-fun mapKey!16341 () (_ BitVec 32))

(declare-fun mapValue!16341 () ValueCell!4566)

(assert (=> mapNonEmpty!16341 (= (arr!11225 _values!549) (store mapRest!16341 mapKey!16341 mapValue!16341))))

(declare-fun b!395544 () Bool)

(assert (=> b!395544 (= e!239467 false)))

(declare-fun lt!187090 () Bool)

(declare-datatypes ((List!6513 0))(
  ( (Nil!6510) (Cons!6509 (h!7365 (_ BitVec 64)) (t!11687 List!6513)) )
))
(declare-fun arrayNoDuplicates!0 (array!23547 (_ BitVec 32) List!6513) Bool)

(assert (=> b!395544 (= lt!187090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6510))))

(declare-fun mapIsEmpty!16341 () Bool)

(assert (=> mapIsEmpty!16341 mapRes!16341))

(assert (= (and start!38352 res!226768) b!395541))

(assert (= (and b!395541 res!226769) b!395543))

(assert (= (and b!395543 res!226770) b!395542))

(assert (= (and b!395542 res!226771) b!395544))

(assert (= (and b!395539 condMapEmpty!16341) mapIsEmpty!16341))

(assert (= (and b!395539 (not condMapEmpty!16341)) mapNonEmpty!16341))

(get-info :version)

(assert (= (and mapNonEmpty!16341 ((_ is ValueCellFull!4566) mapValue!16341)) b!395540))

(assert (= (and b!395539 ((_ is ValueCellFull!4566) mapDefault!16341)) b!395538))

(assert (= start!38352 b!395539))

(declare-fun m!391543 () Bool)

(assert (=> b!395541 m!391543))

(declare-fun m!391545 () Bool)

(assert (=> mapNonEmpty!16341 m!391545))

(declare-fun m!391547 () Bool)

(assert (=> b!395542 m!391547))

(declare-fun m!391549 () Bool)

(assert (=> b!395544 m!391549))

(declare-fun m!391551 () Bool)

(assert (=> start!38352 m!391551))

(declare-fun m!391553 () Bool)

(assert (=> start!38352 m!391553))

(check-sat (not b!395541) (not mapNonEmpty!16341) (not b!395542) (not b!395544) tp_is_empty!9819 (not start!38352))
(check-sat)
