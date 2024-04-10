; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70520 () Bool)

(assert start!70520)

(declare-fun b_free!12847 () Bool)

(declare-fun b_next!12847 () Bool)

(assert (=> start!70520 (= b_free!12847 (not b_next!12847))))

(declare-fun tp!45274 () Bool)

(declare-fun b_and!21677 () Bool)

(assert (=> start!70520 (= tp!45274 b_and!21677)))

(declare-fun b!819192 () Bool)

(declare-fun res!559028 () Bool)

(declare-fun e!454890 () Bool)

(assert (=> b!819192 (=> (not res!559028) (not e!454890))))

(declare-datatypes ((array!45310 0))(
  ( (array!45311 (arr!21709 (Array (_ BitVec 32) (_ BitVec 64))) (size!22130 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45310)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24411 0))(
  ( (V!24412 (val!7326 Int)) )
))
(declare-datatypes ((ValueCell!6863 0))(
  ( (ValueCellFull!6863 (v!9755 V!24411)) (EmptyCell!6863) )
))
(declare-datatypes ((array!45312 0))(
  ( (array!45313 (arr!21710 (Array (_ BitVec 32) ValueCell!6863)) (size!22131 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45312)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!819192 (= res!559028 (and (= (size!22131 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22130 _keys!976) (size!22131 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819193 () Bool)

(declare-fun res!559027 () Bool)

(assert (=> b!819193 (=> (not res!559027) (not e!454890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45310 (_ BitVec 32)) Bool)

(assert (=> b!819193 (= res!559027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819194 () Bool)

(declare-fun e!454892 () Bool)

(declare-fun tp_is_empty!14557 () Bool)

(assert (=> b!819194 (= e!454892 tp_is_empty!14557)))

(declare-datatypes ((tuple2!9636 0))(
  ( (tuple2!9637 (_1!4829 (_ BitVec 64)) (_2!4829 V!24411)) )
))
(declare-datatypes ((List!15466 0))(
  ( (Nil!15463) (Cons!15462 (h!16591 tuple2!9636) (t!21795 List!15466)) )
))
(declare-datatypes ((ListLongMap!8459 0))(
  ( (ListLongMap!8460 (toList!4245 List!15466)) )
))
(declare-fun lt!367497 () ListLongMap!8459)

(declare-fun b!819195 () Bool)

(declare-fun lt!367495 () ListLongMap!8459)

(declare-fun zeroValueAfter!34 () V!24411)

(declare-fun e!454888 () Bool)

(declare-fun +!1842 (ListLongMap!8459 tuple2!9636) ListLongMap!8459)

(assert (=> b!819195 (= e!454888 (= lt!367497 (+!1842 lt!367495 (tuple2!9637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!559032 () Bool)

(assert (=> start!70520 (=> (not res!559032) (not e!454890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70520 (= res!559032 (validMask!0 mask!1312))))

(assert (=> start!70520 e!454890))

(assert (=> start!70520 tp_is_empty!14557))

(declare-fun array_inv!17353 (array!45310) Bool)

(assert (=> start!70520 (array_inv!17353 _keys!976)))

(assert (=> start!70520 true))

(declare-fun e!454886 () Bool)

(declare-fun array_inv!17354 (array!45312) Bool)

(assert (=> start!70520 (and (array_inv!17354 _values!788) e!454886)))

(assert (=> start!70520 tp!45274))

(declare-fun b!819196 () Bool)

(declare-fun e!454891 () Bool)

(declare-fun mapRes!23434 () Bool)

(assert (=> b!819196 (= e!454886 (and e!454891 mapRes!23434))))

(declare-fun condMapEmpty!23434 () Bool)

(declare-fun mapDefault!23434 () ValueCell!6863)

