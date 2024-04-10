; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107120 () Bool)

(assert start!107120)

(declare-fun b_free!27625 () Bool)

(declare-fun b_next!27625 () Bool)

(assert (=> start!107120 (= b_free!27625 (not b_next!27625))))

(declare-fun tp!97102 () Bool)

(declare-fun b_and!45657 () Bool)

(assert (=> start!107120 (= tp!97102 b_and!45657)))

(declare-fun b!1270035 () Bool)

(declare-fun e!723899 () Bool)

(declare-fun tp_is_empty!32809 () Bool)

(assert (=> b!1270035 (= e!723899 tp_is_empty!32809)))

(declare-fun b!1270036 () Bool)

(declare-fun res!845177 () Bool)

(declare-fun e!723900 () Bool)

(assert (=> b!1270036 (=> (not res!845177) (not e!723900))))

(declare-datatypes ((array!82880 0))(
  ( (array!82881 (arr!39977 (Array (_ BitVec 32) (_ BitVec 64))) (size!40513 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82880)

(declare-datatypes ((List!28463 0))(
  ( (Nil!28460) (Cons!28459 (h!29668 (_ BitVec 64)) (t!41992 List!28463)) )
))
(declare-fun arrayNoDuplicates!0 (array!82880 (_ BitVec 32) List!28463) Bool)

(assert (=> b!1270036 (= res!845177 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28460))))

(declare-fun b!1270037 () Bool)

(declare-fun res!845180 () Bool)

(assert (=> b!1270037 (=> (not res!845180) (not e!723900))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82880 (_ BitVec 32)) Bool)

(assert (=> b!1270037 (= res!845180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270038 () Bool)

(declare-fun e!723902 () Bool)

(declare-fun mapRes!50794 () Bool)

(assert (=> b!1270038 (= e!723902 (and e!723899 mapRes!50794))))

(declare-fun condMapEmpty!50794 () Bool)

(declare-datatypes ((V!48939 0))(
  ( (V!48940 (val!16479 Int)) )
))
(declare-datatypes ((ValueCell!15551 0))(
  ( (ValueCellFull!15551 (v!19116 V!48939)) (EmptyCell!15551) )
))
(declare-datatypes ((array!82882 0))(
  ( (array!82883 (arr!39978 (Array (_ BitVec 32) ValueCell!15551)) (size!40514 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82882)

(declare-fun mapDefault!50794 () ValueCell!15551)

