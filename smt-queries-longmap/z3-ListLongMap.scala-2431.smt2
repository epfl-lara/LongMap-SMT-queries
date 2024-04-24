; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38342 () Bool)

(assert start!38342)

(declare-fun b!395541 () Bool)

(declare-fun res!226801 () Bool)

(declare-fun e!239462 () Bool)

(assert (=> b!395541 (=> (not res!226801) (not e!239462))))

(declare-datatypes ((array!23544 0))(
  ( (array!23545 (arr!11224 (Array (_ BitVec 32) (_ BitVec 64))) (size!11576 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23544)

(declare-datatypes ((List!6378 0))(
  ( (Nil!6375) (Cons!6374 (h!7230 (_ BitVec 64)) (t!11544 List!6378)) )
))
(declare-fun arrayNoDuplicates!0 (array!23544 (_ BitVec 32) List!6378) Bool)

(assert (=> b!395541 (= res!226801 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6375))))

(declare-fun b!395542 () Bool)

(declare-fun e!239464 () Bool)

(declare-fun tp_is_empty!9823 () Bool)

(assert (=> b!395542 (= e!239464 tp_is_empty!9823)))

(declare-fun b!395543 () Bool)

(declare-fun res!226804 () Bool)

(assert (=> b!395543 (=> (not res!226804) (not e!239462))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395543 (= res!226804 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395544 () Bool)

(declare-fun res!226803 () Bool)

(assert (=> b!395544 (=> (not res!226803) (not e!239462))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395544 (= res!226803 (validMask!0 mask!1025))))

(declare-fun b!395545 () Bool)

(declare-fun res!226800 () Bool)

(assert (=> b!395545 (=> (not res!226800) (not e!239462))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395545 (= res!226800 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11576 _keys!709))))))

(declare-fun b!395546 () Bool)

(declare-fun res!226802 () Bool)

(assert (=> b!395546 (=> (not res!226802) (not e!239462))))

(assert (=> b!395546 (= res!226802 (or (= (select (arr!11224 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11224 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395547 () Bool)

(declare-fun res!226805 () Bool)

(assert (=> b!395547 (=> (not res!226805) (not e!239462))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14203 0))(
  ( (V!14204 (val!4956 Int)) )
))
(declare-datatypes ((ValueCell!4568 0))(
  ( (ValueCellFull!4568 (v!7203 V!14203)) (EmptyCell!4568) )
))
(declare-datatypes ((array!23546 0))(
  ( (array!23547 (arr!11225 (Array (_ BitVec 32) ValueCell!4568)) (size!11577 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23546)

(assert (=> b!395547 (= res!226805 (and (= (size!11577 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11576 _keys!709) (size!11577 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395548 () Bool)

(assert (=> b!395548 (= e!239462 (and (= (size!11576 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11576 _keys!709))))))

(declare-fun mapIsEmpty!16347 () Bool)

(declare-fun mapRes!16347 () Bool)

(assert (=> mapIsEmpty!16347 mapRes!16347))

(declare-fun b!395549 () Bool)

(declare-fun e!239465 () Bool)

(assert (=> b!395549 (= e!239465 (and e!239464 mapRes!16347))))

(declare-fun condMapEmpty!16347 () Bool)

(declare-fun mapDefault!16347 () ValueCell!4568)

(assert (=> b!395549 (= condMapEmpty!16347 (= (arr!11225 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4568)) mapDefault!16347)))))

(declare-fun b!395550 () Bool)

(declare-fun res!226806 () Bool)

(assert (=> b!395550 (=> (not res!226806) (not e!239462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395550 (= res!226806 (validKeyInArray!0 k0!794))))

(declare-fun b!395551 () Bool)

(declare-fun e!239461 () Bool)

(assert (=> b!395551 (= e!239461 tp_is_empty!9823)))

(declare-fun b!395552 () Bool)

(declare-fun res!226799 () Bool)

(assert (=> b!395552 (=> (not res!226799) (not e!239462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23544 (_ BitVec 32)) Bool)

(assert (=> b!395552 (= res!226799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16347 () Bool)

(declare-fun tp!32142 () Bool)

(assert (=> mapNonEmpty!16347 (= mapRes!16347 (and tp!32142 e!239461))))

(declare-fun mapValue!16347 () ValueCell!4568)

(declare-fun mapRest!16347 () (Array (_ BitVec 32) ValueCell!4568))

(declare-fun mapKey!16347 () (_ BitVec 32))

(assert (=> mapNonEmpty!16347 (= (arr!11225 _values!549) (store mapRest!16347 mapKey!16347 mapValue!16347))))

(declare-fun res!226807 () Bool)

(assert (=> start!38342 (=> (not res!226807) (not e!239462))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38342 (= res!226807 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11576 _keys!709))))))

(assert (=> start!38342 e!239462))

(assert (=> start!38342 true))

(declare-fun array_inv!8302 (array!23546) Bool)

(assert (=> start!38342 (and (array_inv!8302 _values!549) e!239465)))

(declare-fun array_inv!8303 (array!23544) Bool)

(assert (=> start!38342 (array_inv!8303 _keys!709)))

(assert (= (and start!38342 res!226807) b!395544))

(assert (= (and b!395544 res!226803) b!395547))

(assert (= (and b!395547 res!226805) b!395552))

(assert (= (and b!395552 res!226799) b!395541))

(assert (= (and b!395541 res!226801) b!395545))

(assert (= (and b!395545 res!226800) b!395550))

(assert (= (and b!395550 res!226806) b!395546))

(assert (= (and b!395546 res!226802) b!395543))

(assert (= (and b!395543 res!226804) b!395548))

(assert (= (and b!395549 condMapEmpty!16347) mapIsEmpty!16347))

(assert (= (and b!395549 (not condMapEmpty!16347)) mapNonEmpty!16347))

(get-info :version)

(assert (= (and mapNonEmpty!16347 ((_ is ValueCellFull!4568) mapValue!16347)) b!395551))

(assert (= (and b!395549 ((_ is ValueCellFull!4568) mapDefault!16347)) b!395542))

(assert (= start!38342 b!395549))

(declare-fun m!391797 () Bool)

(assert (=> b!395550 m!391797))

(declare-fun m!391799 () Bool)

(assert (=> b!395552 m!391799))

(declare-fun m!391801 () Bool)

(assert (=> b!395544 m!391801))

(declare-fun m!391803 () Bool)

(assert (=> b!395543 m!391803))

(declare-fun m!391805 () Bool)

(assert (=> b!395546 m!391805))

(declare-fun m!391807 () Bool)

(assert (=> mapNonEmpty!16347 m!391807))

(declare-fun m!391809 () Bool)

(assert (=> start!38342 m!391809))

(declare-fun m!391811 () Bool)

(assert (=> start!38342 m!391811))

(declare-fun m!391813 () Bool)

(assert (=> b!395541 m!391813))

(check-sat tp_is_empty!9823 (not b!395550) (not b!395544) (not start!38342) (not mapNonEmpty!16347) (not b!395552) (not b!395543) (not b!395541))
(check-sat)
