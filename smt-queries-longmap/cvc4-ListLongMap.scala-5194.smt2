; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70168 () Bool)

(assert start!70168)

(declare-fun b_free!12575 () Bool)

(declare-fun b_next!12575 () Bool)

(assert (=> start!70168 (= b_free!12575 (not b_next!12575))))

(declare-fun tp!44442 () Bool)

(declare-fun b_and!21355 () Bool)

(assert (=> start!70168 (= tp!44442 b_and!21355)))

(declare-fun b!815277 () Bool)

(declare-fun e!452049 () Bool)

(declare-fun tp_is_empty!14285 () Bool)

(assert (=> b!815277 (= e!452049 tp_is_empty!14285)))

(declare-fun b!815278 () Bool)

(declare-fun e!452051 () Bool)

(assert (=> b!815278 (= e!452051 tp_is_empty!14285)))

(declare-fun b!815279 () Bool)

(declare-fun res!556739 () Bool)

(declare-fun e!452052 () Bool)

(assert (=> b!815279 (=> (not res!556739) (not e!452052))))

(declare-datatypes ((array!44772 0))(
  ( (array!44773 (arr!21445 (Array (_ BitVec 32) (_ BitVec 64))) (size!21866 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44772)

(declare-datatypes ((List!15261 0))(
  ( (Nil!15258) (Cons!15257 (h!16386 (_ BitVec 64)) (t!21580 List!15261)) )
))
(declare-fun arrayNoDuplicates!0 (array!44772 (_ BitVec 32) List!15261) Bool)

(assert (=> b!815279 (= res!556739 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15258))))

(declare-fun b!815280 () Bool)

(declare-fun res!556741 () Bool)

(assert (=> b!815280 (=> (not res!556741) (not e!452052))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24047 0))(
  ( (V!24048 (val!7190 Int)) )
))
(declare-datatypes ((ValueCell!6727 0))(
  ( (ValueCellFull!6727 (v!9617 V!24047)) (EmptyCell!6727) )
))
(declare-datatypes ((array!44774 0))(
  ( (array!44775 (arr!21446 (Array (_ BitVec 32) ValueCell!6727)) (size!21867 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44774)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!815280 (= res!556741 (and (= (size!21867 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21866 _keys!976) (size!21867 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556738 () Bool)

(assert (=> start!70168 (=> (not res!556738) (not e!452052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70168 (= res!556738 (validMask!0 mask!1312))))

(assert (=> start!70168 e!452052))

(assert (=> start!70168 tp_is_empty!14285))

(declare-fun array_inv!17159 (array!44772) Bool)

(assert (=> start!70168 (array_inv!17159 _keys!976)))

(assert (=> start!70168 true))

(declare-fun e!452053 () Bool)

(declare-fun array_inv!17160 (array!44774) Bool)

(assert (=> start!70168 (and (array_inv!17160 _values!788) e!452053)))

(assert (=> start!70168 tp!44442))

(declare-fun mapNonEmpty!23011 () Bool)

(declare-fun mapRes!23011 () Bool)

(declare-fun tp!44443 () Bool)

(assert (=> mapNonEmpty!23011 (= mapRes!23011 (and tp!44443 e!452051))))

(declare-fun mapValue!23011 () ValueCell!6727)

(declare-fun mapKey!23011 () (_ BitVec 32))

(declare-fun mapRest!23011 () (Array (_ BitVec 32) ValueCell!6727))

(assert (=> mapNonEmpty!23011 (= (arr!21446 _values!788) (store mapRest!23011 mapKey!23011 mapValue!23011))))

(declare-fun b!815281 () Bool)

(assert (=> b!815281 (= e!452053 (and e!452049 mapRes!23011))))

(declare-fun condMapEmpty!23011 () Bool)

(declare-fun mapDefault!23011 () ValueCell!6727)

