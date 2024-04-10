; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70576 () Bool)

(assert start!70576)

(declare-fun b_free!12883 () Bool)

(declare-fun b_next!12883 () Bool)

(assert (=> start!70576 (= b_free!12883 (not b_next!12883))))

(declare-fun tp!45385 () Bool)

(declare-fun b_and!21725 () Bool)

(assert (=> start!70576 (= tp!45385 b_and!21725)))

(declare-fun b!819872 () Bool)

(declare-fun res!559447 () Bool)

(declare-fun e!455390 () Bool)

(assert (=> b!819872 (=> (not res!559447) (not e!455390))))

(declare-datatypes ((array!45382 0))(
  ( (array!45383 (arr!21744 (Array (_ BitVec 32) (_ BitVec 64))) (size!22165 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45382)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45382 (_ BitVec 32)) Bool)

(assert (=> b!819872 (= res!559447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!559443 () Bool)

(assert (=> start!70576 (=> (not res!559443) (not e!455390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70576 (= res!559443 (validMask!0 mask!1312))))

(assert (=> start!70576 e!455390))

(declare-fun tp_is_empty!14593 () Bool)

(assert (=> start!70576 tp_is_empty!14593))

(declare-fun array_inv!17381 (array!45382) Bool)

(assert (=> start!70576 (array_inv!17381 _keys!976)))

(assert (=> start!70576 true))

(declare-datatypes ((V!24459 0))(
  ( (V!24460 (val!7344 Int)) )
))
(declare-datatypes ((ValueCell!6881 0))(
  ( (ValueCellFull!6881 (v!9774 V!24459)) (EmptyCell!6881) )
))
(declare-datatypes ((array!45384 0))(
  ( (array!45385 (arr!21745 (Array (_ BitVec 32) ValueCell!6881)) (size!22166 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45384)

(declare-fun e!455389 () Bool)

(declare-fun array_inv!17382 (array!45384) Bool)

(assert (=> start!70576 (and (array_inv!17382 _values!788) e!455389)))

(assert (=> start!70576 tp!45385))

(declare-fun e!455393 () Bool)

(declare-fun b!819873 () Bool)

(declare-fun zeroValueAfter!34 () V!24459)

(declare-datatypes ((tuple2!9670 0))(
  ( (tuple2!9671 (_1!4846 (_ BitVec 64)) (_2!4846 V!24459)) )
))
(declare-datatypes ((List!15493 0))(
  ( (Nil!15490) (Cons!15489 (h!16618 tuple2!9670) (t!21824 List!15493)) )
))
(declare-datatypes ((ListLongMap!8493 0))(
  ( (ListLongMap!8494 (toList!4262 List!15493)) )
))
(declare-fun lt!368193 () ListLongMap!8493)

(declare-fun lt!368190 () ListLongMap!8493)

(declare-fun +!1857 (ListLongMap!8493 tuple2!9670) ListLongMap!8493)

(assert (=> b!819873 (= e!455393 (= lt!368193 (+!1857 lt!368190 (tuple2!9671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23491 () Bool)

(declare-fun mapRes!23491 () Bool)

(assert (=> mapIsEmpty!23491 mapRes!23491))

(declare-fun b!819874 () Bool)

(declare-fun e!455394 () Bool)

(assert (=> b!819874 (= e!455390 (not e!455394))))

(declare-fun res!559446 () Bool)

(assert (=> b!819874 (=> res!559446 e!455394)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819874 (= res!559446 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!368194 () ListLongMap!8493)

(assert (=> b!819874 (= lt!368194 lt!368190)))

(declare-datatypes ((Unit!28003 0))(
  ( (Unit!28004) )
))
(declare-fun lt!368187 () Unit!28003)

(declare-fun zeroValueBefore!34 () V!24459)

(declare-fun minValue!754 () V!24459)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!401 (array!45382 array!45384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 V!24459 V!24459 (_ BitVec 32) Int) Unit!28003)

(assert (=> b!819874 (= lt!368187 (lemmaNoChangeToArrayThenSameMapNoExtras!401 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2291 (array!45382 array!45384 (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 (_ BitVec 32) Int) ListLongMap!8493)

(assert (=> b!819874 (= lt!368190 (getCurrentListMapNoExtraKeys!2291 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819874 (= lt!368194 (getCurrentListMapNoExtraKeys!2291 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819875 () Bool)

(declare-fun e!455391 () Bool)

(assert (=> b!819875 (= e!455389 (and e!455391 mapRes!23491))))

(declare-fun condMapEmpty!23491 () Bool)

(declare-fun mapDefault!23491 () ValueCell!6881)

