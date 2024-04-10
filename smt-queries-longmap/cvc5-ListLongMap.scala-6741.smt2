; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84454 () Bool)

(assert start!84454)

(declare-fun b_free!20005 () Bool)

(declare-fun b_next!20005 () Bool)

(assert (=> start!84454 (= b_free!20005 (not b_next!20005))))

(declare-fun tp!69795 () Bool)

(declare-fun b_and!32077 () Bool)

(assert (=> start!84454 (= tp!69795 b_and!32077)))

(declare-fun b!987806 () Bool)

(declare-fun e!557002 () Bool)

(declare-fun tp_is_empty!23221 () Bool)

(assert (=> b!987806 (= e!557002 tp_is_empty!23221)))

(declare-fun b!987807 () Bool)

(declare-fun res!660821 () Bool)

(declare-fun e!556998 () Bool)

(assert (=> b!987807 (=> (not res!660821) (not e!556998))))

(declare-datatypes ((array!62401 0))(
  ( (array!62402 (arr!30056 (Array (_ BitVec 32) (_ BitVec 64))) (size!30535 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62401)

(declare-datatypes ((List!20787 0))(
  ( (Nil!20784) (Cons!20783 (h!21945 (_ BitVec 64)) (t!29720 List!20787)) )
))
(declare-fun arrayNoDuplicates!0 (array!62401 (_ BitVec 32) List!20787) Bool)

(assert (=> b!987807 (= res!660821 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20784))))

(declare-fun b!987808 () Bool)

(declare-fun res!660820 () Bool)

(assert (=> b!987808 (=> (not res!660820) (not e!556998))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987808 (= res!660820 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36866 () Bool)

(declare-fun mapRes!36866 () Bool)

(declare-fun tp!69796 () Bool)

(declare-fun e!557000 () Bool)

(assert (=> mapNonEmpty!36866 (= mapRes!36866 (and tp!69796 e!557000))))

(declare-datatypes ((V!35945 0))(
  ( (V!35946 (val!11661 Int)) )
))
(declare-datatypes ((ValueCell!11129 0))(
  ( (ValueCellFull!11129 (v!14225 V!35945)) (EmptyCell!11129) )
))
(declare-fun mapRest!36866 () (Array (_ BitVec 32) ValueCell!11129))

(declare-datatypes ((array!62403 0))(
  ( (array!62404 (arr!30057 (Array (_ BitVec 32) ValueCell!11129)) (size!30536 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62403)

(declare-fun mapKey!36866 () (_ BitVec 32))

(declare-fun mapValue!36866 () ValueCell!11129)

(assert (=> mapNonEmpty!36866 (= (arr!30057 _values!1278) (store mapRest!36866 mapKey!36866 mapValue!36866))))

(declare-fun b!987809 () Bool)

(declare-fun res!660819 () Bool)

(assert (=> b!987809 (=> (not res!660819) (not e!556998))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62401 (_ BitVec 32)) Bool)

(assert (=> b!987809 (= res!660819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987810 () Bool)

(declare-fun res!660822 () Bool)

(assert (=> b!987810 (=> (not res!660822) (not e!556998))))

(assert (=> b!987810 (= res!660822 (and (= (size!30536 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30535 _keys!1544) (size!30536 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987811 () Bool)

(declare-fun res!660823 () Bool)

(assert (=> b!987811 (=> (not res!660823) (not e!556998))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987811 (= res!660823 (validKeyInArray!0 (select (arr!30056 _keys!1544) from!1932)))))

(declare-fun e!556997 () Bool)

(declare-datatypes ((tuple2!14856 0))(
  ( (tuple2!14857 (_1!7439 (_ BitVec 64)) (_2!7439 V!35945)) )
))
(declare-fun lt!438044 () tuple2!14856)

(declare-fun zeroValue!1220 () V!35945)

(declare-fun defaultEntry!1281 () Int)

(declare-fun minValue!1220 () V!35945)

(declare-fun b!987812 () Bool)

(declare-datatypes ((List!20788 0))(
  ( (Nil!20785) (Cons!20784 (h!21946 tuple2!14856) (t!29721 List!20788)) )
))
(declare-datatypes ((ListLongMap!13553 0))(
  ( (ListLongMap!13554 (toList!6792 List!20788)) )
))
(declare-fun getCurrentListMap!3859 (array!62401 array!62403 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13553)

(declare-fun +!3077 (ListLongMap!13553 tuple2!14856) ListLongMap!13553)

(assert (=> b!987812 (= e!556997 (= (getCurrentListMap!3859 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3077 (getCurrentListMap!3859 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438044)))))

(declare-fun lt!438043 () tuple2!14856)

(declare-fun lt!438045 () ListLongMap!13553)

(declare-fun lt!438040 () ListLongMap!13553)

(assert (=> b!987812 (= lt!438045 (+!3077 (+!3077 lt!438040 lt!438044) lt!438043))))

(declare-fun lt!438037 () V!35945)

(declare-datatypes ((Unit!32787 0))(
  ( (Unit!32788) )
))
(declare-fun lt!438039 () Unit!32787)

(declare-fun addCommutativeForDiffKeys!701 (ListLongMap!13553 (_ BitVec 64) V!35945 (_ BitVec 64) V!35945) Unit!32787)

(assert (=> b!987812 (= lt!438039 (addCommutativeForDiffKeys!701 lt!438040 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30056 _keys!1544) from!1932) lt!438037))))

(declare-fun b!987805 () Bool)

(assert (=> b!987805 (= e!557000 tp_is_empty!23221)))

(declare-fun res!660826 () Bool)

(assert (=> start!84454 (=> (not res!660826) (not e!556998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84454 (= res!660826 (validMask!0 mask!1948))))

(assert (=> start!84454 e!556998))

(assert (=> start!84454 true))

(assert (=> start!84454 tp_is_empty!23221))

(declare-fun e!557001 () Bool)

(declare-fun array_inv!23225 (array!62403) Bool)

(assert (=> start!84454 (and (array_inv!23225 _values!1278) e!557001)))

(assert (=> start!84454 tp!69795))

(declare-fun array_inv!23226 (array!62401) Bool)

(assert (=> start!84454 (array_inv!23226 _keys!1544)))

(declare-fun b!987813 () Bool)

(assert (=> b!987813 (= e!556998 (not e!556997))))

(declare-fun res!660824 () Bool)

(assert (=> b!987813 (=> res!660824 e!556997)))

(assert (=> b!987813 (= res!660824 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30056 _keys!1544) from!1932)))))

(declare-fun lt!438041 () ListLongMap!13553)

(declare-fun lt!438042 () tuple2!14856)

(assert (=> b!987813 (= (+!3077 lt!438041 lt!438044) (+!3077 lt!438045 lt!438042))))

(declare-fun lt!438036 () ListLongMap!13553)

(assert (=> b!987813 (= lt!438045 (+!3077 lt!438036 lt!438044))))

(assert (=> b!987813 (= lt!438044 (tuple2!14857 (select (arr!30056 _keys!1544) from!1932) lt!438037))))

(assert (=> b!987813 (= lt!438041 (+!3077 lt!438036 lt!438042))))

(assert (=> b!987813 (= lt!438042 (tuple2!14857 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!438038 () Unit!32787)

(assert (=> b!987813 (= lt!438038 (addCommutativeForDiffKeys!701 lt!438036 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30056 _keys!1544) from!1932) lt!438037))))

(declare-fun get!15597 (ValueCell!11129 V!35945) V!35945)

(declare-fun dynLambda!1860 (Int (_ BitVec 64)) V!35945)

(assert (=> b!987813 (= lt!438037 (get!15597 (select (arr!30057 _values!1278) from!1932) (dynLambda!1860 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987813 (= lt!438036 (+!3077 lt!438040 lt!438043))))

(assert (=> b!987813 (= lt!438043 (tuple2!14857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3483 (array!62401 array!62403 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13553)

(assert (=> b!987813 (= lt!438040 (getCurrentListMapNoExtraKeys!3483 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!987814 () Bool)

(assert (=> b!987814 (= e!557001 (and e!557002 mapRes!36866))))

(declare-fun condMapEmpty!36866 () Bool)

(declare-fun mapDefault!36866 () ValueCell!11129)

