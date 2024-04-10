; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40916 () Bool)

(assert start!40916)

(declare-fun b_free!10851 () Bool)

(declare-fun b_next!10851 () Bool)

(assert (=> start!40916 (= b_free!10851 (not b_next!10851))))

(declare-fun tp!38379 () Bool)

(declare-fun b_and!18993 () Bool)

(assert (=> start!40916 (= tp!38379 b_and!18993)))

(declare-fun b!454772 () Bool)

(declare-fun e!266017 () Bool)

(declare-fun tp_is_empty!12189 () Bool)

(assert (=> b!454772 (= e!266017 tp_is_empty!12189)))

(declare-fun b!454773 () Bool)

(declare-fun res!271035 () Bool)

(declare-fun e!266016 () Bool)

(assert (=> b!454773 (=> (not res!271035) (not e!266016))))

(declare-datatypes ((array!28181 0))(
  ( (array!28182 (arr!13534 (Array (_ BitVec 32) (_ BitVec 64))) (size!13886 (_ BitVec 32))) )
))
(declare-fun lt!206202 () array!28181)

(declare-datatypes ((List!8150 0))(
  ( (Nil!8147) (Cons!8146 (h!9002 (_ BitVec 64)) (t!13978 List!8150)) )
))
(declare-fun arrayNoDuplicates!0 (array!28181 (_ BitVec 32) List!8150) Bool)

(assert (=> b!454773 (= res!271035 (arrayNoDuplicates!0 lt!206202 #b00000000000000000000000000000000 Nil!8147))))

(declare-fun b!454774 () Bool)

(declare-fun res!271041 () Bool)

(declare-fun e!266013 () Bool)

(assert (=> b!454774 (=> (not res!271041) (not e!266013))))

(declare-fun _keys!709 () array!28181)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454774 (= res!271041 (or (= (select (arr!13534 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13534 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454775 () Bool)

(declare-fun res!271037 () Bool)

(assert (=> b!454775 (=> (not res!271037) (not e!266013))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454775 (= res!271037 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19924 () Bool)

(declare-fun mapRes!19924 () Bool)

(declare-fun tp!38380 () Bool)

(assert (=> mapNonEmpty!19924 (= mapRes!19924 (and tp!38380 e!266017))))

(declare-fun mapKey!19924 () (_ BitVec 32))

(declare-datatypes ((V!17357 0))(
  ( (V!17358 (val!6139 Int)) )
))
(declare-datatypes ((ValueCell!5751 0))(
  ( (ValueCellFull!5751 (v!8405 V!17357)) (EmptyCell!5751) )
))
(declare-fun mapValue!19924 () ValueCell!5751)

(declare-datatypes ((array!28183 0))(
  ( (array!28184 (arr!13535 (Array (_ BitVec 32) ValueCell!5751)) (size!13887 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28183)

(declare-fun mapRest!19924 () (Array (_ BitVec 32) ValueCell!5751))

(assert (=> mapNonEmpty!19924 (= (arr!13535 _values!549) (store mapRest!19924 mapKey!19924 mapValue!19924))))

(declare-fun b!454777 () Bool)

(declare-fun e!266012 () Bool)

(declare-fun e!266015 () Bool)

(assert (=> b!454777 (= e!266012 (and e!266015 mapRes!19924))))

(declare-fun condMapEmpty!19924 () Bool)

(declare-fun mapDefault!19924 () ValueCell!5751)

(assert (=> b!454777 (= condMapEmpty!19924 (= (arr!13535 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5751)) mapDefault!19924)))))

(declare-fun mapIsEmpty!19924 () Bool)

(assert (=> mapIsEmpty!19924 mapRes!19924))

(declare-fun b!454778 () Bool)

(assert (=> b!454778 (= e!266016 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17357)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17357)

(declare-fun v!412 () V!17357)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8088 0))(
  ( (tuple2!8089 (_1!4055 (_ BitVec 64)) (_2!4055 V!17357)) )
))
(declare-datatypes ((List!8151 0))(
  ( (Nil!8148) (Cons!8147 (h!9003 tuple2!8088) (t!13979 List!8151)) )
))
(declare-datatypes ((ListLongMap!7001 0))(
  ( (ListLongMap!7002 (toList!3516 List!8151)) )
))
(declare-fun lt!206203 () ListLongMap!7001)

(declare-fun getCurrentListMapNoExtraKeys!1699 (array!28181 array!28183 (_ BitVec 32) (_ BitVec 32) V!17357 V!17357 (_ BitVec 32) Int) ListLongMap!7001)

(assert (=> b!454778 (= lt!206203 (getCurrentListMapNoExtraKeys!1699 lt!206202 (array!28184 (store (arr!13535 _values!549) i!563 (ValueCellFull!5751 v!412)) (size!13887 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206204 () ListLongMap!7001)

(assert (=> b!454778 (= lt!206204 (getCurrentListMapNoExtraKeys!1699 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454779 () Bool)

(declare-fun res!271040 () Bool)

(assert (=> b!454779 (=> (not res!271040) (not e!266016))))

(assert (=> b!454779 (= res!271040 (bvsle from!863 i!563))))

(declare-fun b!454780 () Bool)

(assert (=> b!454780 (= e!266013 e!266016)))

(declare-fun res!271033 () Bool)

(assert (=> b!454780 (=> (not res!271033) (not e!266016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28181 (_ BitVec 32)) Bool)

(assert (=> b!454780 (= res!271033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206202 mask!1025))))

(assert (=> b!454780 (= lt!206202 (array!28182 (store (arr!13534 _keys!709) i!563 k0!794) (size!13886 _keys!709)))))

(declare-fun b!454781 () Bool)

(declare-fun res!271034 () Bool)

(assert (=> b!454781 (=> (not res!271034) (not e!266013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454781 (= res!271034 (validKeyInArray!0 k0!794))))

(declare-fun b!454782 () Bool)

(declare-fun res!271042 () Bool)

(assert (=> b!454782 (=> (not res!271042) (not e!266013))))

(assert (=> b!454782 (= res!271042 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8147))))

(declare-fun res!271032 () Bool)

(assert (=> start!40916 (=> (not res!271032) (not e!266013))))

(assert (=> start!40916 (= res!271032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13886 _keys!709))))))

(assert (=> start!40916 e!266013))

(assert (=> start!40916 tp_is_empty!12189))

(assert (=> start!40916 tp!38379))

(assert (=> start!40916 true))

(declare-fun array_inv!9804 (array!28183) Bool)

(assert (=> start!40916 (and (array_inv!9804 _values!549) e!266012)))

(declare-fun array_inv!9805 (array!28181) Bool)

(assert (=> start!40916 (array_inv!9805 _keys!709)))

(declare-fun b!454776 () Bool)

(declare-fun res!271043 () Bool)

(assert (=> b!454776 (=> (not res!271043) (not e!266013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454776 (= res!271043 (validMask!0 mask!1025))))

(declare-fun b!454783 () Bool)

(declare-fun res!271038 () Bool)

(assert (=> b!454783 (=> (not res!271038) (not e!266013))))

(assert (=> b!454783 (= res!271038 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13886 _keys!709))))))

(declare-fun b!454784 () Bool)

(declare-fun res!271036 () Bool)

(assert (=> b!454784 (=> (not res!271036) (not e!266013))))

(assert (=> b!454784 (= res!271036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454785 () Bool)

(declare-fun res!271039 () Bool)

(assert (=> b!454785 (=> (not res!271039) (not e!266013))))

(assert (=> b!454785 (= res!271039 (and (= (size!13887 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13886 _keys!709) (size!13887 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454786 () Bool)

(assert (=> b!454786 (= e!266015 tp_is_empty!12189)))

(assert (= (and start!40916 res!271032) b!454776))

(assert (= (and b!454776 res!271043) b!454785))

(assert (= (and b!454785 res!271039) b!454784))

(assert (= (and b!454784 res!271036) b!454782))

(assert (= (and b!454782 res!271042) b!454783))

(assert (= (and b!454783 res!271038) b!454781))

(assert (= (and b!454781 res!271034) b!454774))

(assert (= (and b!454774 res!271041) b!454775))

(assert (= (and b!454775 res!271037) b!454780))

(assert (= (and b!454780 res!271033) b!454773))

(assert (= (and b!454773 res!271035) b!454779))

(assert (= (and b!454779 res!271040) b!454778))

(assert (= (and b!454777 condMapEmpty!19924) mapIsEmpty!19924))

(assert (= (and b!454777 (not condMapEmpty!19924)) mapNonEmpty!19924))

(get-info :version)

(assert (= (and mapNonEmpty!19924 ((_ is ValueCellFull!5751) mapValue!19924)) b!454772))

(assert (= (and b!454777 ((_ is ValueCellFull!5751) mapDefault!19924)) b!454786))

(assert (= start!40916 b!454777))

(declare-fun m!438781 () Bool)

(assert (=> b!454780 m!438781))

(declare-fun m!438783 () Bool)

(assert (=> b!454780 m!438783))

(declare-fun m!438785 () Bool)

(assert (=> start!40916 m!438785))

(declare-fun m!438787 () Bool)

(assert (=> start!40916 m!438787))

(declare-fun m!438789 () Bool)

(assert (=> b!454775 m!438789))

(declare-fun m!438791 () Bool)

(assert (=> b!454776 m!438791))

(declare-fun m!438793 () Bool)

(assert (=> b!454781 m!438793))

(declare-fun m!438795 () Bool)

(assert (=> b!454778 m!438795))

(declare-fun m!438797 () Bool)

(assert (=> b!454778 m!438797))

(declare-fun m!438799 () Bool)

(assert (=> b!454778 m!438799))

(declare-fun m!438801 () Bool)

(assert (=> b!454784 m!438801))

(declare-fun m!438803 () Bool)

(assert (=> b!454773 m!438803))

(declare-fun m!438805 () Bool)

(assert (=> b!454774 m!438805))

(declare-fun m!438807 () Bool)

(assert (=> mapNonEmpty!19924 m!438807))

(declare-fun m!438809 () Bool)

(assert (=> b!454782 m!438809))

(check-sat (not b_next!10851) b_and!18993 (not mapNonEmpty!19924) (not start!40916) (not b!454781) (not b!454773) (not b!454778) (not b!454780) (not b!454775) (not b!454776) tp_is_empty!12189 (not b!454782) (not b!454784))
(check-sat b_and!18993 (not b_next!10851))
