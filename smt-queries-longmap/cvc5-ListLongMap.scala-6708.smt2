; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84220 () Bool)

(assert start!84220)

(declare-fun b_free!19921 () Bool)

(declare-fun b_next!19921 () Bool)

(assert (=> start!84220 (= b_free!19921 (not b_next!19921))))

(declare-fun tp!69367 () Bool)

(declare-fun b_and!31919 () Bool)

(assert (=> start!84220 (= tp!69367 b_and!31919)))

(declare-fun b!985157 () Bool)

(declare-fun e!555335 () Bool)

(declare-fun e!555336 () Bool)

(assert (=> b!985157 (= e!555335 e!555336)))

(declare-fun res!659230 () Bool)

(assert (=> b!985157 (=> (not res!659230) (not e!555336))))

(declare-datatypes ((array!62021 0))(
  ( (array!62022 (arr!29868 (Array (_ BitVec 32) (_ BitVec 64))) (size!30347 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62021)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985157 (= res!659230 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29868 _keys!1544) from!1932))))))

(declare-datatypes ((V!35681 0))(
  ( (V!35682 (val!11562 Int)) )
))
(declare-fun lt!437123 () V!35681)

(declare-datatypes ((ValueCell!11030 0))(
  ( (ValueCellFull!11030 (v!14124 V!35681)) (EmptyCell!11030) )
))
(declare-datatypes ((array!62023 0))(
  ( (array!62024 (arr!29869 (Array (_ BitVec 32) ValueCell!11030)) (size!30348 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62023)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15500 (ValueCell!11030 V!35681) V!35681)

(declare-fun dynLambda!1831 (Int (_ BitVec 64)) V!35681)

(assert (=> b!985157 (= lt!437123 (get!15500 (select (arr!29869 _values!1278) from!1932) (dynLambda!1831 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35681)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14790 0))(
  ( (tuple2!14791 (_1!7406 (_ BitVec 64)) (_2!7406 V!35681)) )
))
(declare-datatypes ((List!20682 0))(
  ( (Nil!20679) (Cons!20678 (h!21840 tuple2!14790) (t!29547 List!20682)) )
))
(declare-datatypes ((ListLongMap!13487 0))(
  ( (ListLongMap!13488 (toList!6759 List!20682)) )
))
(declare-fun lt!437124 () ListLongMap!13487)

(declare-fun zeroValue!1220 () V!35681)

(declare-fun getCurrentListMapNoExtraKeys!3451 (array!62021 array!62023 (_ BitVec 32) (_ BitVec 32) V!35681 V!35681 (_ BitVec 32) Int) ListLongMap!13487)

(assert (=> b!985157 (= lt!437124 (getCurrentListMapNoExtraKeys!3451 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!659226 () Bool)

(assert (=> start!84220 (=> (not res!659226) (not e!555335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84220 (= res!659226 (validMask!0 mask!1948))))

(assert (=> start!84220 e!555335))

(assert (=> start!84220 true))

(declare-fun tp_is_empty!23023 () Bool)

(assert (=> start!84220 tp_is_empty!23023))

(declare-fun e!555333 () Bool)

(declare-fun array_inv!23089 (array!62023) Bool)

(assert (=> start!84220 (and (array_inv!23089 _values!1278) e!555333)))

(assert (=> start!84220 tp!69367))

(declare-fun array_inv!23090 (array!62021) Bool)

(assert (=> start!84220 (array_inv!23090 _keys!1544)))

(declare-fun b!985158 () Bool)

(declare-fun res!659224 () Bool)

(assert (=> b!985158 (=> (not res!659224) (not e!555335))))

(assert (=> b!985158 (= res!659224 (and (= (size!30348 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30347 _keys!1544) (size!30348 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985159 () Bool)

(declare-fun res!659228 () Bool)

(assert (=> b!985159 (=> (not res!659228) (not e!555335))))

(declare-datatypes ((List!20683 0))(
  ( (Nil!20680) (Cons!20679 (h!21841 (_ BitVec 64)) (t!29548 List!20683)) )
))
(declare-fun arrayNoDuplicates!0 (array!62021 (_ BitVec 32) List!20683) Bool)

(assert (=> b!985159 (= res!659228 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20680))))

(declare-fun b!985160 () Bool)

(declare-fun res!659225 () Bool)

(assert (=> b!985160 (=> (not res!659225) (not e!555335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985160 (= res!659225 (validKeyInArray!0 (select (arr!29868 _keys!1544) from!1932)))))

(declare-fun b!985161 () Bool)

(declare-fun res!659227 () Bool)

(assert (=> b!985161 (=> (not res!659227) (not e!555335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62021 (_ BitVec 32)) Bool)

(assert (=> b!985161 (= res!659227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985162 () Bool)

(declare-fun e!555331 () Bool)

(declare-fun mapRes!36563 () Bool)

(assert (=> b!985162 (= e!555333 (and e!555331 mapRes!36563))))

(declare-fun condMapEmpty!36563 () Bool)

(declare-fun mapDefault!36563 () ValueCell!11030)

