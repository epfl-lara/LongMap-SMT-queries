; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84190 () Bool)

(assert start!84190)

(declare-fun b_free!19891 () Bool)

(declare-fun b_next!19891 () Bool)

(assert (=> start!84190 (= b_free!19891 (not b_next!19891))))

(declare-fun tp!69277 () Bool)

(declare-fun b_and!31859 () Bool)

(assert (=> start!84190 (= tp!69277 b_and!31859)))

(declare-fun b!984632 () Bool)

(declare-fun res!658869 () Bool)

(declare-fun e!555065 () Bool)

(assert (=> b!984632 (=> (not res!658869) (not e!555065))))

(declare-datatypes ((array!61965 0))(
  ( (array!61966 (arr!29840 (Array (_ BitVec 32) (_ BitVec 64))) (size!30319 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61965)

(declare-datatypes ((List!20660 0))(
  ( (Nil!20657) (Cons!20656 (h!21818 (_ BitVec 64)) (t!29495 List!20660)) )
))
(declare-fun arrayNoDuplicates!0 (array!61965 (_ BitVec 32) List!20660) Bool)

(assert (=> b!984632 (= res!658869 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20657))))

(declare-fun b!984633 () Bool)

(declare-fun res!658866 () Bool)

(assert (=> b!984633 (=> (not res!658866) (not e!555065))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984633 (= res!658866 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984634 () Bool)

(declare-fun res!658867 () Bool)

(assert (=> b!984634 (=> (not res!658867) (not e!555065))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984634 (= res!658867 (validKeyInArray!0 (select (arr!29840 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36518 () Bool)

(declare-fun mapRes!36518 () Bool)

(declare-fun tp!69276 () Bool)

(declare-fun e!555062 () Bool)

(assert (=> mapNonEmpty!36518 (= mapRes!36518 (and tp!69276 e!555062))))

(declare-datatypes ((V!35641 0))(
  ( (V!35642 (val!11547 Int)) )
))
(declare-datatypes ((ValueCell!11015 0))(
  ( (ValueCellFull!11015 (v!14109 V!35641)) (EmptyCell!11015) )
))
(declare-datatypes ((array!61967 0))(
  ( (array!61968 (arr!29841 (Array (_ BitVec 32) ValueCell!11015)) (size!30320 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61967)

(declare-fun mapKey!36518 () (_ BitVec 32))

(declare-fun mapRest!36518 () (Array (_ BitVec 32) ValueCell!11015))

(declare-fun mapValue!36518 () ValueCell!11015)

(assert (=> mapNonEmpty!36518 (= (arr!29841 _values!1278) (store mapRest!36518 mapKey!36518 mapValue!36518))))

(declare-fun b!984635 () Bool)

(declare-fun e!555066 () Bool)

(assert (=> b!984635 (= e!555065 e!555066)))

(declare-fun res!658864 () Bool)

(assert (=> b!984635 (=> (not res!658864) (not e!555066))))

(assert (=> b!984635 (= res!658864 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29840 _keys!1544) from!1932))))))

(declare-fun lt!436900 () V!35641)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15480 (ValueCell!11015 V!35641) V!35641)

(declare-fun dynLambda!1821 (Int (_ BitVec 64)) V!35641)

(assert (=> b!984635 (= lt!436900 (get!15480 (select (arr!29841 _values!1278) from!1932) (dynLambda!1821 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35641)

(declare-datatypes ((tuple2!14768 0))(
  ( (tuple2!14769 (_1!7395 (_ BitVec 64)) (_2!7395 V!35641)) )
))
(declare-datatypes ((List!20661 0))(
  ( (Nil!20658) (Cons!20657 (h!21819 tuple2!14768) (t!29496 List!20661)) )
))
(declare-datatypes ((ListLongMap!13465 0))(
  ( (ListLongMap!13466 (toList!6748 List!20661)) )
))
(declare-fun lt!436897 () ListLongMap!13465)

(declare-fun zeroValue!1220 () V!35641)

(declare-fun getCurrentListMapNoExtraKeys!3441 (array!61965 array!61967 (_ BitVec 32) (_ BitVec 32) V!35641 V!35641 (_ BitVec 32) Int) ListLongMap!13465)

(assert (=> b!984635 (= lt!436897 (getCurrentListMapNoExtraKeys!3441 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36518 () Bool)

(assert (=> mapIsEmpty!36518 mapRes!36518))

(declare-fun b!984636 () Bool)

(assert (=> b!984636 (= e!555066 (not true))))

(declare-fun lt!436899 () tuple2!14768)

(declare-fun lt!436901 () tuple2!14768)

(declare-fun +!3039 (ListLongMap!13465 tuple2!14768) ListLongMap!13465)

(assert (=> b!984636 (= (+!3039 (+!3039 lt!436897 lt!436899) lt!436901) (+!3039 (+!3039 lt!436897 lt!436901) lt!436899))))

(assert (=> b!984636 (= lt!436901 (tuple2!14769 (select (arr!29840 _keys!1544) from!1932) lt!436900))))

(assert (=> b!984636 (= lt!436899 (tuple2!14769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32717 0))(
  ( (Unit!32718) )
))
(declare-fun lt!436898 () Unit!32717)

(declare-fun addCommutativeForDiffKeys!667 (ListLongMap!13465 (_ BitVec 64) V!35641 (_ BitVec 64) V!35641) Unit!32717)

(assert (=> b!984636 (= lt!436898 (addCommutativeForDiffKeys!667 lt!436897 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29840 _keys!1544) from!1932) lt!436900))))

(declare-fun b!984637 () Bool)

(declare-fun res!658870 () Bool)

(assert (=> b!984637 (=> (not res!658870) (not e!555065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61965 (_ BitVec 32)) Bool)

(assert (=> b!984637 (= res!658870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984638 () Bool)

(declare-fun res!658865 () Bool)

(assert (=> b!984638 (=> (not res!658865) (not e!555065))))

(assert (=> b!984638 (= res!658865 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30319 _keys!1544))))))

(declare-fun b!984639 () Bool)

(declare-fun tp_is_empty!22993 () Bool)

(assert (=> b!984639 (= e!555062 tp_is_empty!22993)))

(declare-fun b!984640 () Bool)

(declare-fun res!658871 () Bool)

(assert (=> b!984640 (=> (not res!658871) (not e!555065))))

(assert (=> b!984640 (= res!658871 (and (= (size!30320 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30319 _keys!1544) (size!30320 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984641 () Bool)

(declare-fun e!555064 () Bool)

(declare-fun e!555061 () Bool)

(assert (=> b!984641 (= e!555064 (and e!555061 mapRes!36518))))

(declare-fun condMapEmpty!36518 () Bool)

(declare-fun mapDefault!36518 () ValueCell!11015)

