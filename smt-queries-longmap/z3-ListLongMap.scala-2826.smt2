; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40922 () Bool)

(assert start!40922)

(declare-fun b_free!10857 () Bool)

(declare-fun b_next!10857 () Bool)

(assert (=> start!40922 (= b_free!10857 (not b_next!10857))))

(declare-fun tp!38397 () Bool)

(declare-fun b_and!18999 () Bool)

(assert (=> start!40922 (= tp!38397 b_and!18999)))

(declare-fun b!454907 () Bool)

(declare-fun res!271145 () Bool)

(declare-fun e!266066 () Bool)

(assert (=> b!454907 (=> (not res!271145) (not e!266066))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454907 (= res!271145 (validKeyInArray!0 k0!794))))

(declare-fun b!454908 () Bool)

(declare-fun e!266069 () Bool)

(declare-fun tp_is_empty!12195 () Bool)

(assert (=> b!454908 (= e!266069 tp_is_empty!12195)))

(declare-fun b!454910 () Bool)

(declare-fun e!266070 () Bool)

(assert (=> b!454910 (= e!266070 tp_is_empty!12195)))

(declare-fun b!454911 () Bool)

(declare-fun res!271143 () Bool)

(assert (=> b!454911 (=> (not res!271143) (not e!266066))))

(declare-datatypes ((array!28193 0))(
  ( (array!28194 (arr!13540 (Array (_ BitVec 32) (_ BitVec 64))) (size!13892 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28193)

(declare-fun arrayContainsKey!0 (array!28193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454911 (= res!271143 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454912 () Bool)

(declare-fun res!271150 () Bool)

(declare-fun e!266068 () Bool)

(assert (=> b!454912 (=> (not res!271150) (not e!266068))))

(declare-fun lt!206231 () array!28193)

(declare-datatypes ((List!8154 0))(
  ( (Nil!8151) (Cons!8150 (h!9006 (_ BitVec 64)) (t!13982 List!8154)) )
))
(declare-fun arrayNoDuplicates!0 (array!28193 (_ BitVec 32) List!8154) Bool)

(assert (=> b!454912 (= res!271150 (arrayNoDuplicates!0 lt!206231 #b00000000000000000000000000000000 Nil!8151))))

(declare-fun b!454913 () Bool)

(declare-fun res!271142 () Bool)

(assert (=> b!454913 (=> (not res!271142) (not e!266066))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28193 (_ BitVec 32)) Bool)

(assert (=> b!454913 (= res!271142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19933 () Bool)

(declare-fun mapRes!19933 () Bool)

(declare-fun tp!38398 () Bool)

(assert (=> mapNonEmpty!19933 (= mapRes!19933 (and tp!38398 e!266069))))

(declare-datatypes ((V!17365 0))(
  ( (V!17366 (val!6142 Int)) )
))
(declare-datatypes ((ValueCell!5754 0))(
  ( (ValueCellFull!5754 (v!8408 V!17365)) (EmptyCell!5754) )
))
(declare-fun mapValue!19933 () ValueCell!5754)

(declare-fun mapRest!19933 () (Array (_ BitVec 32) ValueCell!5754))

(declare-datatypes ((array!28195 0))(
  ( (array!28196 (arr!13541 (Array (_ BitVec 32) ValueCell!5754)) (size!13893 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28195)

(declare-fun mapKey!19933 () (_ BitVec 32))

(assert (=> mapNonEmpty!19933 (= (arr!13541 _values!549) (store mapRest!19933 mapKey!19933 mapValue!19933))))

(declare-fun b!454914 () Bool)

(declare-fun res!271148 () Bool)

(assert (=> b!454914 (=> (not res!271148) (not e!266066))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454914 (= res!271148 (or (= (select (arr!13540 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13540 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454915 () Bool)

(declare-fun res!271144 () Bool)

(assert (=> b!454915 (=> (not res!271144) (not e!266066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454915 (= res!271144 (validMask!0 mask!1025))))

(declare-fun b!454916 () Bool)

(declare-fun res!271151 () Bool)

(assert (=> b!454916 (=> (not res!271151) (not e!266066))))

(assert (=> b!454916 (= res!271151 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8151))))

(declare-fun b!454909 () Bool)

(declare-fun res!271149 () Bool)

(assert (=> b!454909 (=> (not res!271149) (not e!266066))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454909 (= res!271149 (and (= (size!13893 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13892 _keys!709) (size!13893 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!271141 () Bool)

(assert (=> start!40922 (=> (not res!271141) (not e!266066))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40922 (= res!271141 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13892 _keys!709))))))

(assert (=> start!40922 e!266066))

(assert (=> start!40922 tp_is_empty!12195))

(assert (=> start!40922 tp!38397))

(assert (=> start!40922 true))

(declare-fun e!266071 () Bool)

(declare-fun array_inv!9810 (array!28195) Bool)

(assert (=> start!40922 (and (array_inv!9810 _values!549) e!266071)))

(declare-fun array_inv!9811 (array!28193) Bool)

(assert (=> start!40922 (array_inv!9811 _keys!709)))

(declare-fun b!454917 () Bool)

(assert (=> b!454917 (= e!266071 (and e!266070 mapRes!19933))))

(declare-fun condMapEmpty!19933 () Bool)

(declare-fun mapDefault!19933 () ValueCell!5754)

(assert (=> b!454917 (= condMapEmpty!19933 (= (arr!13541 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5754)) mapDefault!19933)))))

(declare-fun b!454918 () Bool)

(declare-fun res!271140 () Bool)

(assert (=> b!454918 (=> (not res!271140) (not e!266066))))

(assert (=> b!454918 (= res!271140 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13892 _keys!709))))))

(declare-fun b!454919 () Bool)

(assert (=> b!454919 (= e!266066 e!266068)))

(declare-fun res!271147 () Bool)

(assert (=> b!454919 (=> (not res!271147) (not e!266068))))

(assert (=> b!454919 (= res!271147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206231 mask!1025))))

(assert (=> b!454919 (= lt!206231 (array!28194 (store (arr!13540 _keys!709) i!563 k0!794) (size!13892 _keys!709)))))

(declare-fun b!454920 () Bool)

(declare-fun res!271146 () Bool)

(assert (=> b!454920 (=> (not res!271146) (not e!266068))))

(assert (=> b!454920 (= res!271146 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19933 () Bool)

(assert (=> mapIsEmpty!19933 mapRes!19933))

(declare-fun b!454921 () Bool)

(assert (=> b!454921 (= e!266068 false)))

(declare-fun minValue!515 () V!17365)

(declare-fun zeroValue!515 () V!17365)

(declare-fun v!412 () V!17365)

(declare-datatypes ((tuple2!8092 0))(
  ( (tuple2!8093 (_1!4057 (_ BitVec 64)) (_2!4057 V!17365)) )
))
(declare-datatypes ((List!8155 0))(
  ( (Nil!8152) (Cons!8151 (h!9007 tuple2!8092) (t!13983 List!8155)) )
))
(declare-datatypes ((ListLongMap!7005 0))(
  ( (ListLongMap!7006 (toList!3518 List!8155)) )
))
(declare-fun lt!206230 () ListLongMap!7005)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1701 (array!28193 array!28195 (_ BitVec 32) (_ BitVec 32) V!17365 V!17365 (_ BitVec 32) Int) ListLongMap!7005)

(assert (=> b!454921 (= lt!206230 (getCurrentListMapNoExtraKeys!1701 lt!206231 (array!28196 (store (arr!13541 _values!549) i!563 (ValueCellFull!5754 v!412)) (size!13893 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206229 () ListLongMap!7005)

(assert (=> b!454921 (= lt!206229 (getCurrentListMapNoExtraKeys!1701 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40922 res!271141) b!454915))

(assert (= (and b!454915 res!271144) b!454909))

(assert (= (and b!454909 res!271149) b!454913))

(assert (= (and b!454913 res!271142) b!454916))

(assert (= (and b!454916 res!271151) b!454918))

(assert (= (and b!454918 res!271140) b!454907))

(assert (= (and b!454907 res!271145) b!454914))

(assert (= (and b!454914 res!271148) b!454911))

(assert (= (and b!454911 res!271143) b!454919))

(assert (= (and b!454919 res!271147) b!454912))

(assert (= (and b!454912 res!271150) b!454920))

(assert (= (and b!454920 res!271146) b!454921))

(assert (= (and b!454917 condMapEmpty!19933) mapIsEmpty!19933))

(assert (= (and b!454917 (not condMapEmpty!19933)) mapNonEmpty!19933))

(get-info :version)

(assert (= (and mapNonEmpty!19933 ((_ is ValueCellFull!5754) mapValue!19933)) b!454908))

(assert (= (and b!454917 ((_ is ValueCellFull!5754) mapDefault!19933)) b!454910))

(assert (= start!40922 b!454917))

(declare-fun m!438871 () Bool)

(assert (=> b!454921 m!438871))

(declare-fun m!438873 () Bool)

(assert (=> b!454921 m!438873))

(declare-fun m!438875 () Bool)

(assert (=> b!454921 m!438875))

(declare-fun m!438877 () Bool)

(assert (=> b!454912 m!438877))

(declare-fun m!438879 () Bool)

(assert (=> mapNonEmpty!19933 m!438879))

(declare-fun m!438881 () Bool)

(assert (=> b!454914 m!438881))

(declare-fun m!438883 () Bool)

(assert (=> b!454907 m!438883))

(declare-fun m!438885 () Bool)

(assert (=> b!454913 m!438885))

(declare-fun m!438887 () Bool)

(assert (=> b!454916 m!438887))

(declare-fun m!438889 () Bool)

(assert (=> b!454911 m!438889))

(declare-fun m!438891 () Bool)

(assert (=> b!454919 m!438891))

(declare-fun m!438893 () Bool)

(assert (=> b!454919 m!438893))

(declare-fun m!438895 () Bool)

(assert (=> b!454915 m!438895))

(declare-fun m!438897 () Bool)

(assert (=> start!40922 m!438897))

(declare-fun m!438899 () Bool)

(assert (=> start!40922 m!438899))

(check-sat (not mapNonEmpty!19933) (not b!454913) tp_is_empty!12195 (not b!454916) (not b!454919) (not b!454907) (not b_next!10857) (not b!454911) b_and!18999 (not b!454912) (not b!454921) (not b!454915) (not start!40922))
(check-sat b_and!18999 (not b_next!10857))
