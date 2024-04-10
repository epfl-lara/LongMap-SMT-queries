; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70196 () Bool)

(assert start!70196)

(declare-fun b_free!12589 () Bool)

(declare-fun b_next!12589 () Bool)

(assert (=> start!70196 (= b_free!12589 (not b_next!12589))))

(declare-fun tp!44487 () Bool)

(declare-fun b_and!21377 () Bool)

(assert (=> start!70196 (= tp!44487 b_and!21377)))

(declare-fun b!815511 () Bool)

(declare-fun res!556857 () Bool)

(declare-fun e!452216 () Bool)

(assert (=> b!815511 (=> (not res!556857) (not e!452216))))

(declare-datatypes ((array!44800 0))(
  ( (array!44801 (arr!21458 (Array (_ BitVec 32) (_ BitVec 64))) (size!21879 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44800)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24067 0))(
  ( (V!24068 (val!7197 Int)) )
))
(declare-datatypes ((ValueCell!6734 0))(
  ( (ValueCellFull!6734 (v!9624 V!24067)) (EmptyCell!6734) )
))
(declare-datatypes ((array!44802 0))(
  ( (array!44803 (arr!21459 (Array (_ BitVec 32) ValueCell!6734)) (size!21880 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44802)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!815511 (= res!556857 (and (= (size!21880 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21879 _keys!976) (size!21880 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815512 () Bool)

(declare-fun e!452213 () Bool)

(declare-fun tp_is_empty!14299 () Bool)

(assert (=> b!815512 (= e!452213 tp_is_empty!14299)))

(declare-fun b!815513 () Bool)

(declare-fun res!556856 () Bool)

(assert (=> b!815513 (=> (not res!556856) (not e!452216))))

(declare-datatypes ((List!15271 0))(
  ( (Nil!15268) (Cons!15267 (h!16396 (_ BitVec 64)) (t!21592 List!15271)) )
))
(declare-fun arrayNoDuplicates!0 (array!44800 (_ BitVec 32) List!15271) Bool)

(assert (=> b!815513 (= res!556856 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15268))))

(declare-fun b!815514 () Bool)

(declare-fun res!556859 () Bool)

(assert (=> b!815514 (=> (not res!556859) (not e!452216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44800 (_ BitVec 32)) Bool)

(assert (=> b!815514 (= res!556859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556855 () Bool)

(assert (=> start!70196 (=> (not res!556855) (not e!452216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70196 (= res!556855 (validMask!0 mask!1312))))

(assert (=> start!70196 e!452216))

(assert (=> start!70196 tp_is_empty!14299))

(declare-fun array_inv!17169 (array!44800) Bool)

(assert (=> start!70196 (array_inv!17169 _keys!976)))

(assert (=> start!70196 true))

(declare-fun e!452214 () Bool)

(declare-fun array_inv!17170 (array!44802) Bool)

(assert (=> start!70196 (and (array_inv!17170 _values!788) e!452214)))

(assert (=> start!70196 tp!44487))

(declare-fun b!815515 () Bool)

(declare-fun e!452212 () Bool)

(assert (=> b!815515 (= e!452212 true)))

(declare-fun zeroValueAfter!34 () V!24067)

(declare-fun minValue!754 () V!24067)

(declare-datatypes ((tuple2!9440 0))(
  ( (tuple2!9441 (_1!4731 (_ BitVec 64)) (_2!4731 V!24067)) )
))
(declare-datatypes ((List!15272 0))(
  ( (Nil!15269) (Cons!15268 (h!16397 tuple2!9440) (t!21593 List!15272)) )
))
(declare-datatypes ((ListLongMap!8263 0))(
  ( (ListLongMap!8264 (toList!4147 List!15272)) )
))
(declare-fun lt!365089 () ListLongMap!8263)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2376 (array!44800 array!44802 (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 (_ BitVec 32) Int) ListLongMap!8263)

(assert (=> b!815515 (= lt!365089 (getCurrentListMap!2376 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24067)

(declare-fun lt!365090 () ListLongMap!8263)

(declare-fun +!1782 (ListLongMap!8263 tuple2!9440) ListLongMap!8263)

(assert (=> b!815515 (= lt!365090 (+!1782 (getCurrentListMap!2376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815516 () Bool)

(declare-fun mapRes!23035 () Bool)

(assert (=> b!815516 (= e!452214 (and e!452213 mapRes!23035))))

(declare-fun condMapEmpty!23035 () Bool)

(declare-fun mapDefault!23035 () ValueCell!6734)

