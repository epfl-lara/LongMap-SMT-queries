; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70212 () Bool)

(assert start!70212)

(declare-fun b_free!12605 () Bool)

(declare-fun b_next!12605 () Bool)

(assert (=> start!70212 (= b_free!12605 (not b_next!12605))))

(declare-fun tp!44535 () Bool)

(declare-fun b_and!21393 () Bool)

(assert (=> start!70212 (= tp!44535 b_and!21393)))

(declare-fun b!815703 () Bool)

(declare-fun e!452357 () Bool)

(assert (=> b!815703 (= e!452357 true)))

(declare-datatypes ((array!44830 0))(
  ( (array!44831 (arr!21473 (Array (_ BitVec 32) (_ BitVec 64))) (size!21894 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44830)

(declare-datatypes ((V!24087 0))(
  ( (V!24088 (val!7205 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24087)

(declare-fun minValue!754 () V!24087)

(declare-datatypes ((ValueCell!6742 0))(
  ( (ValueCellFull!6742 (v!9632 V!24087)) (EmptyCell!6742) )
))
(declare-datatypes ((array!44832 0))(
  ( (array!44833 (arr!21474 (Array (_ BitVec 32) ValueCell!6742)) (size!21895 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44832)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9452 0))(
  ( (tuple2!9453 (_1!4737 (_ BitVec 64)) (_2!4737 V!24087)) )
))
(declare-datatypes ((List!15283 0))(
  ( (Nil!15280) (Cons!15279 (h!16408 tuple2!9452) (t!21604 List!15283)) )
))
(declare-datatypes ((ListLongMap!8275 0))(
  ( (ListLongMap!8276 (toList!4153 List!15283)) )
))
(declare-fun lt!365207 () ListLongMap!8275)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2382 (array!44830 array!44832 (_ BitVec 32) (_ BitVec 32) V!24087 V!24087 (_ BitVec 32) Int) ListLongMap!8275)

(assert (=> b!815703 (= lt!365207 (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24087)

(declare-fun lt!365208 () ListLongMap!8275)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1788 (ListLongMap!8275 tuple2!9452) ListLongMap!8275)

(assert (=> b!815703 (= lt!365208 (+!1788 (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun res!556977 () Bool)

(declare-fun e!452355 () Bool)

(assert (=> start!70212 (=> (not res!556977) (not e!452355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70212 (= res!556977 (validMask!0 mask!1312))))

(assert (=> start!70212 e!452355))

(declare-fun tp_is_empty!14315 () Bool)

(assert (=> start!70212 tp_is_empty!14315))

(declare-fun array_inv!17183 (array!44830) Bool)

(assert (=> start!70212 (array_inv!17183 _keys!976)))

(assert (=> start!70212 true))

(declare-fun e!452356 () Bool)

(declare-fun array_inv!17184 (array!44832) Bool)

(assert (=> start!70212 (and (array_inv!17184 _values!788) e!452356)))

(assert (=> start!70212 tp!44535))

(declare-fun b!815704 () Bool)

(declare-fun e!452358 () Bool)

(assert (=> b!815704 (= e!452358 tp_is_empty!14315)))

(declare-fun b!815705 () Bool)

(declare-fun res!556978 () Bool)

(assert (=> b!815705 (=> (not res!556978) (not e!452355))))

(declare-datatypes ((List!15284 0))(
  ( (Nil!15281) (Cons!15280 (h!16409 (_ BitVec 64)) (t!21605 List!15284)) )
))
(declare-fun arrayNoDuplicates!0 (array!44830 (_ BitVec 32) List!15284) Bool)

(assert (=> b!815705 (= res!556978 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15281))))

(declare-fun b!815706 () Bool)

(declare-fun res!556975 () Bool)

(assert (=> b!815706 (=> (not res!556975) (not e!452355))))

(assert (=> b!815706 (= res!556975 (and (= (size!21895 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21894 _keys!976) (size!21895 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815707 () Bool)

(declare-fun e!452360 () Bool)

(declare-fun mapRes!23059 () Bool)

(assert (=> b!815707 (= e!452356 (and e!452360 mapRes!23059))))

(declare-fun condMapEmpty!23059 () Bool)

(declare-fun mapDefault!23059 () ValueCell!6742)

