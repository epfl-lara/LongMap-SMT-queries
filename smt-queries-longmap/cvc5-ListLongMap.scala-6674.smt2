; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84016 () Bool)

(assert start!84016)

(declare-fun b_free!19771 () Bool)

(declare-fun b_next!19771 () Bool)

(assert (=> start!84016 (= b_free!19771 (not b_next!19771))))

(declare-fun tp!68835 () Bool)

(declare-fun b_and!31625 () Bool)

(assert (=> start!84016 (= tp!68835 b_and!31625)))

(declare-fun res!657163 () Bool)

(declare-fun e!553589 () Bool)

(assert (=> start!84016 (=> (not res!657163) (not e!553589))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84016 (= res!657163 (validMask!0 mask!1948))))

(assert (=> start!84016 e!553589))

(assert (=> start!84016 true))

(declare-fun tp_is_empty!22819 () Bool)

(assert (=> start!84016 tp_is_empty!22819))

(declare-datatypes ((V!35409 0))(
  ( (V!35410 (val!11460 Int)) )
))
(declare-datatypes ((ValueCell!10928 0))(
  ( (ValueCellFull!10928 (v!14022 V!35409)) (EmptyCell!10928) )
))
(declare-datatypes ((array!61633 0))(
  ( (array!61634 (arr!29674 (Array (_ BitVec 32) ValueCell!10928)) (size!30153 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61633)

(declare-fun e!553590 () Bool)

(declare-fun array_inv!22945 (array!61633) Bool)

(assert (=> start!84016 (and (array_inv!22945 _values!1278) e!553590)))

(assert (=> start!84016 tp!68835))

(declare-datatypes ((array!61635 0))(
  ( (array!61636 (arr!29675 (Array (_ BitVec 32) (_ BitVec 64))) (size!30154 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61635)

(declare-fun array_inv!22946 (array!61635) Bool)

(assert (=> start!84016 (array_inv!22946 _keys!1544)))

(declare-fun mapIsEmpty!36257 () Bool)

(declare-fun mapRes!36257 () Bool)

(assert (=> mapIsEmpty!36257 mapRes!36257))

(declare-fun b!982034 () Bool)

(declare-fun e!553586 () Bool)

(assert (=> b!982034 (= e!553586 (not true))))

(declare-datatypes ((tuple2!14674 0))(
  ( (tuple2!14675 (_1!7348 (_ BitVec 64)) (_2!7348 V!35409)) )
))
(declare-datatypes ((List!20555 0))(
  ( (Nil!20552) (Cons!20551 (h!21713 tuple2!14674) (t!29276 List!20555)) )
))
(declare-datatypes ((ListLongMap!13371 0))(
  ( (ListLongMap!13372 (toList!6701 List!20555)) )
))
(declare-fun lt!435965 () ListLongMap!13371)

(declare-fun lt!435962 () tuple2!14674)

(declare-fun lt!435963 () tuple2!14674)

(declare-fun +!2999 (ListLongMap!13371 tuple2!14674) ListLongMap!13371)

(assert (=> b!982034 (= (+!2999 (+!2999 lt!435965 lt!435962) lt!435963) (+!2999 (+!2999 lt!435965 lt!435963) lt!435962))))

(declare-fun lt!435961 () V!35409)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982034 (= lt!435963 (tuple2!14675 (select (arr!29675 _keys!1544) from!1932) lt!435961))))

(declare-fun zeroValue!1220 () V!35409)

(assert (=> b!982034 (= lt!435962 (tuple2!14675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32637 0))(
  ( (Unit!32638) )
))
(declare-fun lt!435964 () Unit!32637)

(declare-fun addCommutativeForDiffKeys!627 (ListLongMap!13371 (_ BitVec 64) V!35409 (_ BitVec 64) V!35409) Unit!32637)

(assert (=> b!982034 (= lt!435964 (addCommutativeForDiffKeys!627 lt!435965 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29675 _keys!1544) from!1932) lt!435961))))

(declare-fun b!982035 () Bool)

(declare-fun res!657165 () Bool)

(assert (=> b!982035 (=> (not res!657165) (not e!553589))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982035 (= res!657165 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982036 () Bool)

(declare-fun res!657169 () Bool)

(assert (=> b!982036 (=> (not res!657169) (not e!553589))))

(assert (=> b!982036 (= res!657169 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30154 _keys!1544))))))

(declare-fun b!982037 () Bool)

(assert (=> b!982037 (= e!553589 e!553586)))

(declare-fun res!657167 () Bool)

(assert (=> b!982037 (=> (not res!657167) (not e!553586))))

(assert (=> b!982037 (= res!657167 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29675 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15385 (ValueCell!10928 V!35409) V!35409)

(declare-fun dynLambda!1784 (Int (_ BitVec 64)) V!35409)

(assert (=> b!982037 (= lt!435961 (get!15385 (select (arr!29674 _values!1278) from!1932) (dynLambda!1784 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35409)

(declare-fun getCurrentListMapNoExtraKeys!3401 (array!61635 array!61633 (_ BitVec 32) (_ BitVec 32) V!35409 V!35409 (_ BitVec 32) Int) ListLongMap!13371)

(assert (=> b!982037 (= lt!435965 (getCurrentListMapNoExtraKeys!3401 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982038 () Bool)

(declare-fun res!657166 () Bool)

(assert (=> b!982038 (=> (not res!657166) (not e!553589))))

(declare-datatypes ((List!20556 0))(
  ( (Nil!20553) (Cons!20552 (h!21714 (_ BitVec 64)) (t!29277 List!20556)) )
))
(declare-fun arrayNoDuplicates!0 (array!61635 (_ BitVec 32) List!20556) Bool)

(assert (=> b!982038 (= res!657166 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20553))))

(declare-fun b!982039 () Bool)

(declare-fun res!657170 () Bool)

(assert (=> b!982039 (=> (not res!657170) (not e!553589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61635 (_ BitVec 32)) Bool)

(assert (=> b!982039 (= res!657170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982040 () Bool)

(declare-fun e!553587 () Bool)

(assert (=> b!982040 (= e!553590 (and e!553587 mapRes!36257))))

(declare-fun condMapEmpty!36257 () Bool)

(declare-fun mapDefault!36257 () ValueCell!10928)

