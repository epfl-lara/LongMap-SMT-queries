; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38912 () Bool)

(assert start!38912)

(declare-fun b!407200 () Bool)

(declare-fun res!235402 () Bool)

(declare-fun e!244582 () Bool)

(assert (=> b!407200 (=> (not res!235402) (not e!244582))))

(declare-datatypes ((array!24568 0))(
  ( (array!24569 (arr!11733 (Array (_ BitVec 32) (_ BitVec 64))) (size!12085 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24568)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24568 (_ BitVec 32)) Bool)

(assert (=> b!407200 (= res!235402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407201 () Bool)

(declare-fun e!244579 () Bool)

(assert (=> b!407201 (= e!244579 false)))

(declare-fun lt!188633 () Bool)

(declare-fun lt!188634 () array!24568)

(declare-datatypes ((List!6685 0))(
  ( (Nil!6682) (Cons!6681 (h!7537 (_ BitVec 64)) (t!11851 List!6685)) )
))
(declare-fun arrayNoDuplicates!0 (array!24568 (_ BitVec 32) List!6685) Bool)

(assert (=> b!407201 (= lt!188633 (arrayNoDuplicates!0 lt!188634 #b00000000000000000000000000000000 Nil!6682))))

(declare-fun b!407202 () Bool)

(declare-fun e!244581 () Bool)

(declare-fun tp_is_empty!10345 () Bool)

(assert (=> b!407202 (= e!244581 tp_is_empty!10345)))

(declare-fun res!235404 () Bool)

(assert (=> start!38912 (=> (not res!235404) (not e!244582))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38912 (= res!235404 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12085 _keys!709))))))

(assert (=> start!38912 e!244582))

(assert (=> start!38912 true))

(declare-datatypes ((V!14899 0))(
  ( (V!14900 (val!5217 Int)) )
))
(declare-datatypes ((ValueCell!4829 0))(
  ( (ValueCellFull!4829 (v!7465 V!14899)) (EmptyCell!4829) )
))
(declare-datatypes ((array!24570 0))(
  ( (array!24571 (arr!11734 (Array (_ BitVec 32) ValueCell!4829)) (size!12086 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24570)

(declare-fun e!244580 () Bool)

(declare-fun array_inv!8646 (array!24570) Bool)

(assert (=> start!38912 (and (array_inv!8646 _values!549) e!244580)))

(declare-fun array_inv!8647 (array!24568) Bool)

(assert (=> start!38912 (array_inv!8647 _keys!709)))

(declare-fun b!407203 () Bool)

(declare-fun e!244578 () Bool)

(declare-fun mapRes!17139 () Bool)

(assert (=> b!407203 (= e!244580 (and e!244578 mapRes!17139))))

(declare-fun condMapEmpty!17139 () Bool)

(declare-fun mapDefault!17139 () ValueCell!4829)

(assert (=> b!407203 (= condMapEmpty!17139 (= (arr!11734 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4829)) mapDefault!17139)))))

(declare-fun b!407204 () Bool)

(assert (=> b!407204 (= e!244578 tp_is_empty!10345)))

(declare-fun b!407205 () Bool)

(declare-fun res!235398 () Bool)

(assert (=> b!407205 (=> (not res!235398) (not e!244582))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407205 (= res!235398 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17139 () Bool)

(declare-fun tp!33258 () Bool)

(assert (=> mapNonEmpty!17139 (= mapRes!17139 (and tp!33258 e!244581))))

(declare-fun mapRest!17139 () (Array (_ BitVec 32) ValueCell!4829))

(declare-fun mapValue!17139 () ValueCell!4829)

(declare-fun mapKey!17139 () (_ BitVec 32))

(assert (=> mapNonEmpty!17139 (= (arr!11734 _values!549) (store mapRest!17139 mapKey!17139 mapValue!17139))))

(declare-fun b!407206 () Bool)

(declare-fun res!235396 () Bool)

(assert (=> b!407206 (=> (not res!235396) (not e!244582))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407206 (= res!235396 (or (= (select (arr!11733 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11733 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407207 () Bool)

(assert (=> b!407207 (= e!244582 e!244579)))

(declare-fun res!235395 () Bool)

(assert (=> b!407207 (=> (not res!235395) (not e!244579))))

(assert (=> b!407207 (= res!235395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188634 mask!1025))))

(assert (=> b!407207 (= lt!188634 (array!24569 (store (arr!11733 _keys!709) i!563 k0!794) (size!12085 _keys!709)))))

(declare-fun b!407208 () Bool)

(declare-fun res!235401 () Bool)

(assert (=> b!407208 (=> (not res!235401) (not e!244582))))

(declare-fun arrayContainsKey!0 (array!24568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407208 (= res!235401 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407209 () Bool)

(declare-fun res!235403 () Bool)

(assert (=> b!407209 (=> (not res!235403) (not e!244582))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407209 (= res!235403 (and (= (size!12086 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12085 _keys!709) (size!12086 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407210 () Bool)

(declare-fun res!235400 () Bool)

(assert (=> b!407210 (=> (not res!235400) (not e!244582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407210 (= res!235400 (validMask!0 mask!1025))))

(declare-fun b!407211 () Bool)

(declare-fun res!235397 () Bool)

(assert (=> b!407211 (=> (not res!235397) (not e!244582))))

(assert (=> b!407211 (= res!235397 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6682))))

(declare-fun b!407212 () Bool)

(declare-fun res!235399 () Bool)

(assert (=> b!407212 (=> (not res!235399) (not e!244582))))

(assert (=> b!407212 (= res!235399 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12085 _keys!709))))))

(declare-fun mapIsEmpty!17139 () Bool)

(assert (=> mapIsEmpty!17139 mapRes!17139))

(assert (= (and start!38912 res!235404) b!407210))

(assert (= (and b!407210 res!235400) b!407209))

(assert (= (and b!407209 res!235403) b!407200))

(assert (= (and b!407200 res!235402) b!407211))

(assert (= (and b!407211 res!235397) b!407212))

(assert (= (and b!407212 res!235399) b!407205))

(assert (= (and b!407205 res!235398) b!407206))

(assert (= (and b!407206 res!235396) b!407208))

(assert (= (and b!407208 res!235401) b!407207))

(assert (= (and b!407207 res!235395) b!407201))

(assert (= (and b!407203 condMapEmpty!17139) mapIsEmpty!17139))

(assert (= (and b!407203 (not condMapEmpty!17139)) mapNonEmpty!17139))

(get-info :version)

(assert (= (and mapNonEmpty!17139 ((_ is ValueCellFull!4829) mapValue!17139)) b!407202))

(assert (= (and b!407203 ((_ is ValueCellFull!4829) mapDefault!17139)) b!407204))

(assert (= start!38912 b!407203))

(declare-fun m!399237 () Bool)

(assert (=> b!407200 m!399237))

(declare-fun m!399239 () Bool)

(assert (=> b!407210 m!399239))

(declare-fun m!399241 () Bool)

(assert (=> mapNonEmpty!17139 m!399241))

(declare-fun m!399243 () Bool)

(assert (=> b!407211 m!399243))

(declare-fun m!399245 () Bool)

(assert (=> start!38912 m!399245))

(declare-fun m!399247 () Bool)

(assert (=> start!38912 m!399247))

(declare-fun m!399249 () Bool)

(assert (=> b!407205 m!399249))

(declare-fun m!399251 () Bool)

(assert (=> b!407201 m!399251))

(declare-fun m!399253 () Bool)

(assert (=> b!407207 m!399253))

(declare-fun m!399255 () Bool)

(assert (=> b!407207 m!399255))

(declare-fun m!399257 () Bool)

(assert (=> b!407206 m!399257))

(declare-fun m!399259 () Bool)

(assert (=> b!407208 m!399259))

(check-sat (not b!407200) (not b!407207) (not b!407201) (not start!38912) tp_is_empty!10345 (not b!407211) (not b!407208) (not mapNonEmpty!17139) (not b!407205) (not b!407210))
(check-sat)
