; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83786 () Bool)

(assert start!83786)

(declare-fun b_free!19595 () Bool)

(declare-fun b_next!19595 () Bool)

(assert (=> start!83786 (= b_free!19595 (not b_next!19595))))

(declare-fun tp!68227 () Bool)

(declare-fun b_and!31279 () Bool)

(assert (=> start!83786 (= tp!68227 b_and!31279)))

(declare-fun b!978493 () Bool)

(declare-fun res!654828 () Bool)

(declare-fun e!551643 () Bool)

(assert (=> b!978493 (=> (not res!654828) (not e!551643))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35101 0))(
  ( (V!35102 (val!11345 Int)) )
))
(declare-datatypes ((ValueCell!10813 0))(
  ( (ValueCellFull!10813 (v!13907 V!35101)) (EmptyCell!10813) )
))
(declare-datatypes ((array!61205 0))(
  ( (array!61206 (arr!29460 (Array (_ BitVec 32) ValueCell!10813)) (size!29939 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61205)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61207 0))(
  ( (array!61208 (arr!29461 (Array (_ BitVec 32) (_ BitVec 64))) (size!29940 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61207)

(assert (=> b!978493 (= res!654828 (and (= (size!29939 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29940 _keys!1544) (size!29939 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978494 () Bool)

(declare-fun e!551642 () Bool)

(declare-fun tp_is_empty!22589 () Bool)

(assert (=> b!978494 (= e!551642 tp_is_empty!22589)))

(declare-fun b!978495 () Bool)

(declare-fun res!654829 () Bool)

(assert (=> b!978495 (=> (not res!654829) (not e!551643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61207 (_ BitVec 32)) Bool)

(assert (=> b!978495 (= res!654829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978496 () Bool)

(declare-fun res!654832 () Bool)

(assert (=> b!978496 (=> (not res!654832) (not e!551643))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978496 (= res!654832 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29940 _keys!1544))))))

(declare-fun b!978497 () Bool)

(declare-fun e!551646 () Bool)

(assert (=> b!978497 (= e!551646 tp_is_empty!22589)))

(declare-fun b!978498 () Bool)

(declare-fun res!654830 () Bool)

(assert (=> b!978498 (=> (not res!654830) (not e!551643))))

(declare-datatypes ((List!20420 0))(
  ( (Nil!20417) (Cons!20416 (h!21578 (_ BitVec 64)) (t!28971 List!20420)) )
))
(declare-fun arrayNoDuplicates!0 (array!61207 (_ BitVec 32) List!20420) Bool)

(assert (=> b!978498 (= res!654830 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20417))))

(declare-fun res!654831 () Bool)

(assert (=> start!83786 (=> (not res!654831) (not e!551643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83786 (= res!654831 (validMask!0 mask!1948))))

(assert (=> start!83786 e!551643))

(assert (=> start!83786 true))

(assert (=> start!83786 tp_is_empty!22589))

(declare-fun e!551645 () Bool)

(declare-fun array_inv!22775 (array!61205) Bool)

(assert (=> start!83786 (and (array_inv!22775 _values!1278) e!551645)))

(assert (=> start!83786 tp!68227))

(declare-fun array_inv!22776 (array!61207) Bool)

(assert (=> start!83786 (array_inv!22776 _keys!1544)))

(declare-fun b!978499 () Bool)

(assert (=> b!978499 (= e!551643 (not true))))

(declare-datatypes ((tuple2!14548 0))(
  ( (tuple2!14549 (_1!7285 (_ BitVec 64)) (_2!7285 V!35101)) )
))
(declare-datatypes ((List!20421 0))(
  ( (Nil!20418) (Cons!20417 (h!21579 tuple2!14548) (t!28972 List!20421)) )
))
(declare-datatypes ((ListLongMap!13245 0))(
  ( (ListLongMap!13246 (toList!6638 List!20421)) )
))
(declare-fun lt!433799 () ListLongMap!13245)

(declare-fun lt!433796 () tuple2!14548)

(declare-fun lt!433798 () tuple2!14548)

(declare-fun +!2943 (ListLongMap!13245 tuple2!14548) ListLongMap!13245)

(assert (=> b!978499 (= (+!2943 (+!2943 lt!433799 lt!433796) lt!433798) (+!2943 (+!2943 lt!433799 lt!433798) lt!433796))))

(declare-fun lt!433797 () V!35101)

(assert (=> b!978499 (= lt!433798 (tuple2!14549 (select (arr!29461 _keys!1544) from!1932) lt!433797))))

(declare-fun minValue!1220 () V!35101)

(assert (=> b!978499 (= lt!433796 (tuple2!14549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32525 0))(
  ( (Unit!32526) )
))
(declare-fun lt!433795 () Unit!32525)

(declare-fun addCommutativeForDiffKeys!571 (ListLongMap!13245 (_ BitVec 64) V!35101 (_ BitVec 64) V!35101) Unit!32525)

(assert (=> b!978499 (= lt!433795 (addCommutativeForDiffKeys!571 lt!433799 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29461 _keys!1544) from!1932) lt!433797))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15254 (ValueCell!10813 V!35101) V!35101)

(declare-fun dynLambda!1731 (Int (_ BitVec 64)) V!35101)

(assert (=> b!978499 (= lt!433797 (get!15254 (select (arr!29460 _values!1278) from!1932) (dynLambda!1731 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35101)

(declare-fun getCurrentListMapNoExtraKeys!3345 (array!61207 array!61205 (_ BitVec 32) (_ BitVec 32) V!35101 V!35101 (_ BitVec 32) Int) ListLongMap!13245)

(assert (=> b!978499 (= lt!433799 (+!2943 (getCurrentListMapNoExtraKeys!3345 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!35912 () Bool)

(declare-fun mapRes!35912 () Bool)

(assert (=> mapIsEmpty!35912 mapRes!35912))

(declare-fun b!978500 () Bool)

(declare-fun res!654833 () Bool)

(assert (=> b!978500 (=> (not res!654833) (not e!551643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978500 (= res!654833 (validKeyInArray!0 (select (arr!29461 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35912 () Bool)

(declare-fun tp!68226 () Bool)

(assert (=> mapNonEmpty!35912 (= mapRes!35912 (and tp!68226 e!551646))))

(declare-fun mapKey!35912 () (_ BitVec 32))

(declare-fun mapRest!35912 () (Array (_ BitVec 32) ValueCell!10813))

(declare-fun mapValue!35912 () ValueCell!10813)

(assert (=> mapNonEmpty!35912 (= (arr!29460 _values!1278) (store mapRest!35912 mapKey!35912 mapValue!35912))))

(declare-fun b!978501 () Bool)

(assert (=> b!978501 (= e!551645 (and e!551642 mapRes!35912))))

(declare-fun condMapEmpty!35912 () Bool)

(declare-fun mapDefault!35912 () ValueCell!10813)

