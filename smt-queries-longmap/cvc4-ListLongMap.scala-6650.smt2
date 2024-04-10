; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83876 () Bool)

(assert start!83876)

(declare-fun b_free!19685 () Bool)

(declare-fun b_next!19685 () Bool)

(assert (=> start!83876 (= b_free!19685 (not b_next!19685))))

(declare-fun tp!68496 () Bool)

(declare-fun b_and!31459 () Bool)

(assert (=> start!83876 (= tp!68496 b_and!31459)))

(declare-fun b!980031 () Bool)

(declare-fun res!655877 () Bool)

(declare-fun e!552417 () Bool)

(assert (=> b!980031 (=> (not res!655877) (not e!552417))))

(declare-datatypes ((array!61369 0))(
  ( (array!61370 (arr!29542 (Array (_ BitVec 32) (_ BitVec 64))) (size!30021 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61369)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61369 (_ BitVec 32)) Bool)

(assert (=> b!980031 (= res!655877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36047 () Bool)

(declare-fun mapRes!36047 () Bool)

(declare-fun tp!68497 () Bool)

(declare-fun e!552418 () Bool)

(assert (=> mapNonEmpty!36047 (= mapRes!36047 (and tp!68497 e!552418))))

(declare-datatypes ((V!35221 0))(
  ( (V!35222 (val!11390 Int)) )
))
(declare-datatypes ((ValueCell!10858 0))(
  ( (ValueCellFull!10858 (v!13952 V!35221)) (EmptyCell!10858) )
))
(declare-datatypes ((array!61371 0))(
  ( (array!61372 (arr!29543 (Array (_ BitVec 32) ValueCell!10858)) (size!30022 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61371)

(declare-fun mapRest!36047 () (Array (_ BitVec 32) ValueCell!10858))

(declare-fun mapValue!36047 () ValueCell!10858)

(declare-fun mapKey!36047 () (_ BitVec 32))

(assert (=> mapNonEmpty!36047 (= (arr!29543 _values!1278) (store mapRest!36047 mapKey!36047 mapValue!36047))))

(declare-fun b!980032 () Bool)

(declare-fun e!552416 () Bool)

(assert (=> b!980032 (= e!552417 (not e!552416))))

(declare-fun res!655870 () Bool)

(assert (=> b!980032 (=> res!655870 e!552416)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980032 (= res!655870 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29542 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14610 0))(
  ( (tuple2!14611 (_1!7316 (_ BitVec 64)) (_2!7316 V!35221)) )
))
(declare-fun lt!434964 () tuple2!14610)

(declare-fun lt!434960 () tuple2!14610)

(declare-datatypes ((List!20476 0))(
  ( (Nil!20473) (Cons!20472 (h!21634 tuple2!14610) (t!29117 List!20476)) )
))
(declare-datatypes ((ListLongMap!13307 0))(
  ( (ListLongMap!13308 (toList!6669 List!20476)) )
))
(declare-fun lt!434962 () ListLongMap!13307)

(declare-fun lt!434965 () ListLongMap!13307)

(declare-fun +!2974 (ListLongMap!13307 tuple2!14610) ListLongMap!13307)

(assert (=> b!980032 (= (+!2974 lt!434962 lt!434964) (+!2974 lt!434965 lt!434960))))

(declare-fun lt!434963 () ListLongMap!13307)

(assert (=> b!980032 (= lt!434965 (+!2974 lt!434963 lt!434964))))

(declare-fun lt!434966 () V!35221)

(assert (=> b!980032 (= lt!434964 (tuple2!14611 (select (arr!29542 _keys!1544) from!1932) lt!434966))))

(assert (=> b!980032 (= lt!434962 (+!2974 lt!434963 lt!434960))))

(declare-fun minValue!1220 () V!35221)

(assert (=> b!980032 (= lt!434960 (tuple2!14611 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32587 0))(
  ( (Unit!32588) )
))
(declare-fun lt!434967 () Unit!32587)

(declare-fun addCommutativeForDiffKeys!602 (ListLongMap!13307 (_ BitVec 64) V!35221 (_ BitVec 64) V!35221) Unit!32587)

(assert (=> b!980032 (= lt!434967 (addCommutativeForDiffKeys!602 lt!434963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29542 _keys!1544) from!1932) lt!434966))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15313 (ValueCell!10858 V!35221) V!35221)

(declare-fun dynLambda!1760 (Int (_ BitVec 64)) V!35221)

(assert (=> b!980032 (= lt!434966 (get!15313 (select (arr!29543 _values!1278) from!1932) (dynLambda!1760 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434969 () ListLongMap!13307)

(declare-fun lt!434968 () tuple2!14610)

(assert (=> b!980032 (= lt!434963 (+!2974 lt!434969 lt!434968))))

(declare-fun zeroValue!1220 () V!35221)

(assert (=> b!980032 (= lt!434968 (tuple2!14611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3374 (array!61369 array!61371 (_ BitVec 32) (_ BitVec 32) V!35221 V!35221 (_ BitVec 32) Int) ListLongMap!13307)

(assert (=> b!980032 (= lt!434969 (getCurrentListMapNoExtraKeys!3374 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980033 () Bool)

(declare-fun tp_is_empty!22679 () Bool)

(assert (=> b!980033 (= e!552418 tp_is_empty!22679)))

(declare-fun mapIsEmpty!36047 () Bool)

(assert (=> mapIsEmpty!36047 mapRes!36047))

(declare-fun b!980034 () Bool)

(declare-fun res!655874 () Bool)

(assert (=> b!980034 (=> (not res!655874) (not e!552417))))

(assert (=> b!980034 (= res!655874 (and (= (size!30022 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30021 _keys!1544) (size!30022 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!655872 () Bool)

(assert (=> start!83876 (=> (not res!655872) (not e!552417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83876 (= res!655872 (validMask!0 mask!1948))))

(assert (=> start!83876 e!552417))

(assert (=> start!83876 true))

(assert (=> start!83876 tp_is_empty!22679))

(declare-fun e!552420 () Bool)

(declare-fun array_inv!22839 (array!61371) Bool)

(assert (=> start!83876 (and (array_inv!22839 _values!1278) e!552420)))

(assert (=> start!83876 tp!68496))

(declare-fun array_inv!22840 (array!61369) Bool)

(assert (=> start!83876 (array_inv!22840 _keys!1544)))

(declare-fun b!980035 () Bool)

(declare-fun res!655875 () Bool)

(assert (=> b!980035 (=> (not res!655875) (not e!552417))))

(declare-datatypes ((List!20477 0))(
  ( (Nil!20474) (Cons!20473 (h!21635 (_ BitVec 64)) (t!29118 List!20477)) )
))
(declare-fun arrayNoDuplicates!0 (array!61369 (_ BitVec 32) List!20477) Bool)

(assert (=> b!980035 (= res!655875 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20474))))

(declare-fun b!980036 () Bool)

(assert (=> b!980036 (= e!552416 true)))

(assert (=> b!980036 (= lt!434965 (+!2974 (+!2974 lt!434969 lt!434964) lt!434968))))

(declare-fun lt!434961 () Unit!32587)

(assert (=> b!980036 (= lt!434961 (addCommutativeForDiffKeys!602 lt!434969 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29542 _keys!1544) from!1932) lt!434966))))

(declare-fun b!980037 () Bool)

(declare-fun e!552415 () Bool)

(assert (=> b!980037 (= e!552415 tp_is_empty!22679)))

(declare-fun b!980038 () Bool)

(assert (=> b!980038 (= e!552420 (and e!552415 mapRes!36047))))

(declare-fun condMapEmpty!36047 () Bool)

(declare-fun mapDefault!36047 () ValueCell!10858)

