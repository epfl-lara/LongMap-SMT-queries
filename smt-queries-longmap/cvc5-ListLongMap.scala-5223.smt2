; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70388 () Bool)

(assert start!70388)

(declare-fun b_free!12745 () Bool)

(declare-fun b_next!12745 () Bool)

(assert (=> start!70388 (= b_free!12745 (not b_next!12745))))

(declare-fun tp!44961 () Bool)

(declare-fun b_and!21557 () Bool)

(assert (=> start!70388 (= tp!44961 b_and!21557)))

(declare-fun b!817677 () Bool)

(declare-fun res!558117 () Bool)

(declare-fun e!453765 () Bool)

(assert (=> b!817677 (=> (not res!558117) (not e!453765))))

(declare-datatypes ((array!45108 0))(
  ( (array!45109 (arr!21610 (Array (_ BitVec 32) (_ BitVec 64))) (size!22031 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45108)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24275 0))(
  ( (V!24276 (val!7275 Int)) )
))
(declare-datatypes ((ValueCell!6812 0))(
  ( (ValueCellFull!6812 (v!9704 V!24275)) (EmptyCell!6812) )
))
(declare-datatypes ((array!45110 0))(
  ( (array!45111 (arr!21611 (Array (_ BitVec 32) ValueCell!6812)) (size!22032 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45110)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817677 (= res!558117 (and (= (size!22032 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22031 _keys!976) (size!22032 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817678 () Bool)

(declare-fun res!558118 () Bool)

(assert (=> b!817678 (=> (not res!558118) (not e!453765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45108 (_ BitVec 32)) Bool)

(assert (=> b!817678 (= res!558118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558115 () Bool)

(assert (=> start!70388 (=> (not res!558115) (not e!453765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70388 (= res!558115 (validMask!0 mask!1312))))

(assert (=> start!70388 e!453765))

(declare-fun tp_is_empty!14455 () Bool)

(assert (=> start!70388 tp_is_empty!14455))

(declare-fun array_inv!17283 (array!45108) Bool)

(assert (=> start!70388 (array_inv!17283 _keys!976)))

(assert (=> start!70388 true))

(declare-fun e!453764 () Bool)

(declare-fun array_inv!17284 (array!45110) Bool)

(assert (=> start!70388 (and (array_inv!17284 _values!788) e!453764)))

(assert (=> start!70388 tp!44961))

(declare-fun b!817679 () Bool)

(declare-fun res!558116 () Bool)

(assert (=> b!817679 (=> (not res!558116) (not e!453765))))

(declare-datatypes ((List!15390 0))(
  ( (Nil!15387) (Cons!15386 (h!16515 (_ BitVec 64)) (t!21715 List!15390)) )
))
(declare-fun arrayNoDuplicates!0 (array!45108 (_ BitVec 32) List!15390) Bool)

(assert (=> b!817679 (= res!558116 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15387))))

(declare-fun b!817680 () Bool)

(declare-fun e!453763 () Bool)

(declare-fun mapRes!23275 () Bool)

(assert (=> b!817680 (= e!453764 (and e!453763 mapRes!23275))))

(declare-fun condMapEmpty!23275 () Bool)

(declare-fun mapDefault!23275 () ValueCell!6812)

