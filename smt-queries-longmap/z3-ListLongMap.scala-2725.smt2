; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40154 () Bool)

(assert start!40154)

(declare-fun b_free!10435 () Bool)

(declare-fun b_next!10435 () Bool)

(assert (=> start!40154 (= b_free!10435 (not b_next!10435))))

(declare-fun tp!36834 () Bool)

(declare-fun b_and!18417 () Bool)

(assert (=> start!40154 (= tp!36834 b_and!18417)))

(declare-fun b!439747 () Bool)

(declare-fun res!259980 () Bool)

(declare-fun e!259182 () Bool)

(assert (=> b!439747 (=> (not res!259980) (not e!259182))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439747 (= res!259980 (bvsle from!863 i!563))))

(declare-fun b!439748 () Bool)

(declare-fun res!259971 () Bool)

(declare-fun e!259180 () Bool)

(assert (=> b!439748 (=> (not res!259971) (not e!259180))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439748 (= res!259971 (validMask!0 mask!1025))))

(declare-fun b!439749 () Bool)

(declare-fun res!259973 () Bool)

(assert (=> b!439749 (=> (not res!259973) (not e!259180))))

(declare-datatypes ((array!26996 0))(
  ( (array!26997 (arr!12947 (Array (_ BitVec 32) (_ BitVec 64))) (size!13299 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26996)

(assert (=> b!439749 (= res!259973 (or (= (select (arr!12947 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12947 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439750 () Bool)

(declare-fun res!259977 () Bool)

(assert (=> b!439750 (=> (not res!259977) (not e!259180))))

(assert (=> b!439750 (= res!259977 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13299 _keys!709))))))

(declare-fun b!439751 () Bool)

(declare-fun res!259975 () Bool)

(assert (=> b!439751 (=> (not res!259975) (not e!259180))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439751 (= res!259975 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439752 () Bool)

(declare-fun res!259978 () Bool)

(assert (=> b!439752 (=> (not res!259978) (not e!259182))))

(declare-fun lt!202400 () array!26996)

(declare-datatypes ((List!7649 0))(
  ( (Nil!7646) (Cons!7645 (h!8501 (_ BitVec 64)) (t!13397 List!7649)) )
))
(declare-fun arrayNoDuplicates!0 (array!26996 (_ BitVec 32) List!7649) Bool)

(assert (=> b!439752 (= res!259978 (arrayNoDuplicates!0 lt!202400 #b00000000000000000000000000000000 Nil!7646))))

(declare-fun res!259972 () Bool)

(assert (=> start!40154 (=> (not res!259972) (not e!259180))))

(assert (=> start!40154 (= res!259972 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13299 _keys!709))))))

(assert (=> start!40154 e!259180))

(declare-fun tp_is_empty!11587 () Bool)

(assert (=> start!40154 tp_is_empty!11587))

(assert (=> start!40154 tp!36834))

(assert (=> start!40154 true))

(declare-datatypes ((V!16555 0))(
  ( (V!16556 (val!5838 Int)) )
))
(declare-datatypes ((ValueCell!5450 0))(
  ( (ValueCellFull!5450 (v!8086 V!16555)) (EmptyCell!5450) )
))
(declare-datatypes ((array!26998 0))(
  ( (array!26999 (arr!12948 (Array (_ BitVec 32) ValueCell!5450)) (size!13300 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26998)

(declare-fun e!259183 () Bool)

(declare-fun array_inv!9466 (array!26998) Bool)

(assert (=> start!40154 (and (array_inv!9466 _values!549) e!259183)))

(declare-fun array_inv!9467 (array!26996) Bool)

(assert (=> start!40154 (array_inv!9467 _keys!709)))

(declare-fun mapNonEmpty!19002 () Bool)

(declare-fun mapRes!19002 () Bool)

(declare-fun tp!36833 () Bool)

(declare-fun e!259177 () Bool)

(assert (=> mapNonEmpty!19002 (= mapRes!19002 (and tp!36833 e!259177))))

(declare-fun mapValue!19002 () ValueCell!5450)

(declare-fun mapRest!19002 () (Array (_ BitVec 32) ValueCell!5450))

(declare-fun mapKey!19002 () (_ BitVec 32))

(assert (=> mapNonEmpty!19002 (= (arr!12948 _values!549) (store mapRest!19002 mapKey!19002 mapValue!19002))))

(declare-fun mapIsEmpty!19002 () Bool)

(assert (=> mapIsEmpty!19002 mapRes!19002))

(declare-fun b!439753 () Bool)

(declare-fun e!259179 () Bool)

(assert (=> b!439753 (= e!259179 tp_is_empty!11587)))

(declare-fun b!439754 () Bool)

(declare-fun res!259976 () Bool)

(assert (=> b!439754 (=> (not res!259976) (not e!259180))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!439754 (= res!259976 (and (= (size!13300 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13299 _keys!709) (size!13300 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439755 () Bool)

(declare-fun res!259983 () Bool)

(assert (=> b!439755 (=> (not res!259983) (not e!259180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26996 (_ BitVec 32)) Bool)

(assert (=> b!439755 (= res!259983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439756 () Bool)

(assert (=> b!439756 (= e!259183 (and e!259179 mapRes!19002))))

(declare-fun condMapEmpty!19002 () Bool)

(declare-fun mapDefault!19002 () ValueCell!5450)

(assert (=> b!439756 (= condMapEmpty!19002 (= (arr!12948 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5450)) mapDefault!19002)))))

(declare-fun b!439757 () Bool)

(declare-fun e!259181 () Bool)

(assert (=> b!439757 (= e!259181 (not true))))

(declare-fun lt!202402 () array!26998)

(declare-fun minValue!515 () V!16555)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16555)

(declare-fun v!412 () V!16555)

(declare-datatypes ((tuple2!7662 0))(
  ( (tuple2!7663 (_1!3842 (_ BitVec 64)) (_2!3842 V!16555)) )
))
(declare-datatypes ((List!7650 0))(
  ( (Nil!7647) (Cons!7646 (h!8502 tuple2!7662) (t!13398 List!7650)) )
))
(declare-datatypes ((ListLongMap!6577 0))(
  ( (ListLongMap!6578 (toList!3304 List!7650)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1537 (array!26996 array!26998 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) Int) ListLongMap!6577)

(declare-fun +!1497 (ListLongMap!6577 tuple2!7662) ListLongMap!6577)

(assert (=> b!439757 (= (getCurrentListMapNoExtraKeys!1537 lt!202400 lt!202402 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1497 (getCurrentListMapNoExtraKeys!1537 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7663 k0!794 v!412)))))

(declare-datatypes ((Unit!13069 0))(
  ( (Unit!13070) )
))
(declare-fun lt!202403 () Unit!13069)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!657 (array!26996 array!26998 (_ BitVec 32) (_ BitVec 32) V!16555 V!16555 (_ BitVec 32) (_ BitVec 64) V!16555 (_ BitVec 32) Int) Unit!13069)

(assert (=> b!439757 (= lt!202403 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!657 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439758 () Bool)

(assert (=> b!439758 (= e!259182 e!259181)))

(declare-fun res!259979 () Bool)

(assert (=> b!439758 (=> (not res!259979) (not e!259181))))

(assert (=> b!439758 (= res!259979 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202401 () ListLongMap!6577)

(assert (=> b!439758 (= lt!202401 (getCurrentListMapNoExtraKeys!1537 lt!202400 lt!202402 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439758 (= lt!202402 (array!26999 (store (arr!12948 _values!549) i!563 (ValueCellFull!5450 v!412)) (size!13300 _values!549)))))

(declare-fun lt!202404 () ListLongMap!6577)

(assert (=> b!439758 (= lt!202404 (getCurrentListMapNoExtraKeys!1537 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439759 () Bool)

(assert (=> b!439759 (= e!259177 tp_is_empty!11587)))

(declare-fun b!439760 () Bool)

(declare-fun res!259974 () Bool)

(assert (=> b!439760 (=> (not res!259974) (not e!259180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439760 (= res!259974 (validKeyInArray!0 k0!794))))

(declare-fun b!439761 () Bool)

(assert (=> b!439761 (= e!259180 e!259182)))

(declare-fun res!259981 () Bool)

(assert (=> b!439761 (=> (not res!259981) (not e!259182))))

(assert (=> b!439761 (= res!259981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202400 mask!1025))))

(assert (=> b!439761 (= lt!202400 (array!26997 (store (arr!12947 _keys!709) i!563 k0!794) (size!13299 _keys!709)))))

(declare-fun b!439762 () Bool)

(declare-fun res!259982 () Bool)

(assert (=> b!439762 (=> (not res!259982) (not e!259180))))

(assert (=> b!439762 (= res!259982 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7646))))

(assert (= (and start!40154 res!259972) b!439748))

(assert (= (and b!439748 res!259971) b!439754))

(assert (= (and b!439754 res!259976) b!439755))

(assert (= (and b!439755 res!259983) b!439762))

(assert (= (and b!439762 res!259982) b!439750))

(assert (= (and b!439750 res!259977) b!439760))

(assert (= (and b!439760 res!259974) b!439749))

(assert (= (and b!439749 res!259973) b!439751))

(assert (= (and b!439751 res!259975) b!439761))

(assert (= (and b!439761 res!259981) b!439752))

(assert (= (and b!439752 res!259978) b!439747))

(assert (= (and b!439747 res!259980) b!439758))

(assert (= (and b!439758 res!259979) b!439757))

(assert (= (and b!439756 condMapEmpty!19002) mapIsEmpty!19002))

(assert (= (and b!439756 (not condMapEmpty!19002)) mapNonEmpty!19002))

(get-info :version)

(assert (= (and mapNonEmpty!19002 ((_ is ValueCellFull!5450) mapValue!19002)) b!439759))

(assert (= (and b!439756 ((_ is ValueCellFull!5450) mapDefault!19002)) b!439753))

(assert (= start!40154 b!439756))

(declare-fun m!427193 () Bool)

(assert (=> b!439752 m!427193))

(declare-fun m!427195 () Bool)

(assert (=> b!439751 m!427195))

(declare-fun m!427197 () Bool)

(assert (=> b!439761 m!427197))

(declare-fun m!427199 () Bool)

(assert (=> b!439761 m!427199))

(declare-fun m!427201 () Bool)

(assert (=> b!439757 m!427201))

(declare-fun m!427203 () Bool)

(assert (=> b!439757 m!427203))

(assert (=> b!439757 m!427203))

(declare-fun m!427205 () Bool)

(assert (=> b!439757 m!427205))

(declare-fun m!427207 () Bool)

(assert (=> b!439757 m!427207))

(declare-fun m!427209 () Bool)

(assert (=> mapNonEmpty!19002 m!427209))

(declare-fun m!427211 () Bool)

(assert (=> start!40154 m!427211))

(declare-fun m!427213 () Bool)

(assert (=> start!40154 m!427213))

(declare-fun m!427215 () Bool)

(assert (=> b!439748 m!427215))

(declare-fun m!427217 () Bool)

(assert (=> b!439755 m!427217))

(declare-fun m!427219 () Bool)

(assert (=> b!439749 m!427219))

(declare-fun m!427221 () Bool)

(assert (=> b!439758 m!427221))

(declare-fun m!427223 () Bool)

(assert (=> b!439758 m!427223))

(declare-fun m!427225 () Bool)

(assert (=> b!439758 m!427225))

(declare-fun m!427227 () Bool)

(assert (=> b!439762 m!427227))

(declare-fun m!427229 () Bool)

(assert (=> b!439760 m!427229))

(check-sat (not mapNonEmpty!19002) (not b!439760) (not b!439755) (not b!439752) b_and!18417 (not b!439748) (not b!439758) (not b!439757) (not b!439751) (not b!439762) (not start!40154) tp_is_empty!11587 (not b!439761) (not b_next!10435))
(check-sat b_and!18417 (not b_next!10435))
