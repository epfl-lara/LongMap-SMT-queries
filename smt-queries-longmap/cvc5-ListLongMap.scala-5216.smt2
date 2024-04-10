; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70346 () Bool)

(assert start!70346)

(declare-fun b_free!12703 () Bool)

(declare-fun b_next!12703 () Bool)

(assert (=> start!70346 (= b_free!12703 (not b_next!12703))))

(declare-fun tp!44835 () Bool)

(declare-fun b_and!21515 () Bool)

(assert (=> start!70346 (= tp!44835 b_and!21515)))

(declare-fun mapNonEmpty!23212 () Bool)

(declare-fun mapRes!23212 () Bool)

(declare-fun tp!44836 () Bool)

(declare-fun e!453446 () Bool)

(assert (=> mapNonEmpty!23212 (= mapRes!23212 (and tp!44836 e!453446))))

(declare-fun mapKey!23212 () (_ BitVec 32))

(declare-datatypes ((V!24219 0))(
  ( (V!24220 (val!7254 Int)) )
))
(declare-datatypes ((ValueCell!6791 0))(
  ( (ValueCellFull!6791 (v!9683 V!24219)) (EmptyCell!6791) )
))
(declare-datatypes ((array!45026 0))(
  ( (array!45027 (arr!21569 (Array (_ BitVec 32) ValueCell!6791)) (size!21990 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45026)

(declare-fun mapValue!23212 () ValueCell!6791)

(declare-fun mapRest!23212 () (Array (_ BitVec 32) ValueCell!6791))

(assert (=> mapNonEmpty!23212 (= (arr!21569 _values!788) (store mapRest!23212 mapKey!23212 mapValue!23212))))

(declare-fun b!817236 () Bool)

(declare-fun tp_is_empty!14413 () Bool)

(assert (=> b!817236 (= e!453446 tp_is_empty!14413)))

(declare-fun b!817237 () Bool)

(declare-fun res!557863 () Bool)

(declare-fun e!453450 () Bool)

(assert (=> b!817237 (=> (not res!557863) (not e!453450))))

(declare-datatypes ((array!45028 0))(
  ( (array!45029 (arr!21570 (Array (_ BitVec 32) (_ BitVec 64))) (size!21991 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45028)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45028 (_ BitVec 32)) Bool)

(assert (=> b!817237 (= res!557863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817238 () Bool)

(declare-fun res!557866 () Bool)

(assert (=> b!817238 (=> (not res!557866) (not e!453450))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817238 (= res!557866 (and (= (size!21990 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21991 _keys!976) (size!21990 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557865 () Bool)

(assert (=> start!70346 (=> (not res!557865) (not e!453450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70346 (= res!557865 (validMask!0 mask!1312))))

(assert (=> start!70346 e!453450))

(assert (=> start!70346 tp_is_empty!14413))

(declare-fun array_inv!17257 (array!45028) Bool)

(assert (=> start!70346 (array_inv!17257 _keys!976)))

(assert (=> start!70346 true))

(declare-fun e!453448 () Bool)

(declare-fun array_inv!17258 (array!45026) Bool)

(assert (=> start!70346 (and (array_inv!17258 _values!788) e!453448)))

(assert (=> start!70346 tp!44835))

(declare-fun b!817239 () Bool)

(declare-fun e!453447 () Bool)

(assert (=> b!817239 (= e!453447 tp_is_empty!14413)))

(declare-fun mapIsEmpty!23212 () Bool)

(assert (=> mapIsEmpty!23212 mapRes!23212))

(declare-fun b!817240 () Bool)

(assert (=> b!817240 (= e!453448 (and e!453447 mapRes!23212))))

(declare-fun condMapEmpty!23212 () Bool)

(declare-fun mapDefault!23212 () ValueCell!6791)

