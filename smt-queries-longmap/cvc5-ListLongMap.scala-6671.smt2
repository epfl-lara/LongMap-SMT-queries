; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83998 () Bool)

(assert start!83998)

(declare-fun b_free!19753 () Bool)

(declare-fun b_next!19753 () Bool)

(assert (=> start!83998 (= b_free!19753 (not b_next!19753))))

(declare-fun tp!68782 () Bool)

(declare-fun b_and!31589 () Bool)

(assert (=> start!83998 (= tp!68782 b_and!31589)))

(declare-fun b!981719 () Bool)

(declare-fun res!656951 () Bool)

(declare-fun e!553425 () Bool)

(assert (=> b!981719 (=> (not res!656951) (not e!553425))))

(declare-datatypes ((array!61597 0))(
  ( (array!61598 (arr!29656 (Array (_ BitVec 32) (_ BitVec 64))) (size!30135 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61597)

(declare-datatypes ((List!20541 0))(
  ( (Nil!20538) (Cons!20537 (h!21699 (_ BitVec 64)) (t!29244 List!20541)) )
))
(declare-fun arrayNoDuplicates!0 (array!61597 (_ BitVec 32) List!20541) Bool)

(assert (=> b!981719 (= res!656951 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20538))))

(declare-fun b!981720 () Bool)

(declare-fun e!553424 () Bool)

(declare-fun tp_is_empty!22801 () Bool)

(assert (=> b!981720 (= e!553424 tp_is_empty!22801)))

(declare-fun b!981721 () Bool)

(declare-fun res!656947 () Bool)

(assert (=> b!981721 (=> (not res!656947) (not e!553425))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35385 0))(
  ( (V!35386 (val!11451 Int)) )
))
(declare-datatypes ((ValueCell!10919 0))(
  ( (ValueCellFull!10919 (v!14013 V!35385)) (EmptyCell!10919) )
))
(declare-datatypes ((array!61599 0))(
  ( (array!61600 (arr!29657 (Array (_ BitVec 32) ValueCell!10919)) (size!30136 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61599)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981721 (= res!656947 (and (= (size!30136 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30135 _keys!1544) (size!30136 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981722 () Bool)

(declare-fun res!656949 () Bool)

(assert (=> b!981722 (=> (not res!656949) (not e!553425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61597 (_ BitVec 32)) Bool)

(assert (=> b!981722 (= res!656949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656954 () Bool)

(assert (=> start!83998 (=> (not res!656954) (not e!553425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83998 (= res!656954 (validMask!0 mask!1948))))

(assert (=> start!83998 e!553425))

(assert (=> start!83998 true))

(assert (=> start!83998 tp_is_empty!22801))

(declare-fun e!553428 () Bool)

(declare-fun array_inv!22931 (array!61599) Bool)

(assert (=> start!83998 (and (array_inv!22931 _values!1278) e!553428)))

(assert (=> start!83998 tp!68782))

(declare-fun array_inv!22932 (array!61597) Bool)

(assert (=> start!83998 (array_inv!22932 _keys!1544)))

(declare-fun b!981723 () Bool)

(declare-fun e!553423 () Bool)

(assert (=> b!981723 (= e!553423 (not true))))

(declare-datatypes ((tuple2!14658 0))(
  ( (tuple2!14659 (_1!7340 (_ BitVec 64)) (_2!7340 V!35385)) )
))
(declare-datatypes ((List!20542 0))(
  ( (Nil!20539) (Cons!20538 (h!21700 tuple2!14658) (t!29245 List!20542)) )
))
(declare-datatypes ((ListLongMap!13355 0))(
  ( (ListLongMap!13356 (toList!6693 List!20542)) )
))
(declare-fun lt!435830 () ListLongMap!13355)

(declare-fun lt!435826 () tuple2!14658)

(declare-fun lt!435829 () tuple2!14658)

(declare-fun +!2993 (ListLongMap!13355 tuple2!14658) ListLongMap!13355)

(assert (=> b!981723 (= (+!2993 (+!2993 lt!435830 lt!435826) lt!435829) (+!2993 (+!2993 lt!435830 lt!435829) lt!435826))))

(declare-fun lt!435828 () V!35385)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981723 (= lt!435829 (tuple2!14659 (select (arr!29656 _keys!1544) from!1932) lt!435828))))

(declare-fun zeroValue!1220 () V!35385)

(assert (=> b!981723 (= lt!435826 (tuple2!14659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32625 0))(
  ( (Unit!32626) )
))
(declare-fun lt!435827 () Unit!32625)

(declare-fun addCommutativeForDiffKeys!621 (ListLongMap!13355 (_ BitVec 64) V!35385 (_ BitVec 64) V!35385) Unit!32625)

(assert (=> b!981723 (= lt!435827 (addCommutativeForDiffKeys!621 lt!435830 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29656 _keys!1544) from!1932) lt!435828))))

(declare-fun b!981724 () Bool)

(declare-fun res!656948 () Bool)

(assert (=> b!981724 (=> (not res!656948) (not e!553425))))

(assert (=> b!981724 (= res!656948 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981725 () Bool)

(declare-fun mapRes!36230 () Bool)

(assert (=> b!981725 (= e!553428 (and e!553424 mapRes!36230))))

(declare-fun condMapEmpty!36230 () Bool)

(declare-fun mapDefault!36230 () ValueCell!10919)

