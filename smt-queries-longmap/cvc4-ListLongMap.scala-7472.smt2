; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94760 () Bool)

(assert start!94760)

(declare-fun b_free!22013 () Bool)

(declare-fun b_next!22013 () Bool)

(assert (=> start!94760 (= b_free!22013 (not b_next!22013))))

(declare-fun tp!77497 () Bool)

(declare-fun b_and!34843 () Bool)

(assert (=> start!94760 (= tp!77497 b_and!34843)))

(declare-fun b!1071480 () Bool)

(declare-fun res!714772 () Bool)

(declare-fun e!611829 () Bool)

(assert (=> b!1071480 (=> (not res!714772) (not e!611829))))

(declare-datatypes ((array!68619 0))(
  ( (array!68620 (arr!33005 (Array (_ BitVec 32) (_ BitVec 64))) (size!33541 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68619)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68619 (_ BitVec 32)) Bool)

(assert (=> b!1071480 (= res!714772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40441 () Bool)

(declare-fun mapRes!40441 () Bool)

(declare-fun tp!77498 () Bool)

(declare-fun e!611825 () Bool)

(assert (=> mapNonEmpty!40441 (= mapRes!40441 (and tp!77498 e!611825))))

(declare-datatypes ((V!39565 0))(
  ( (V!39566 (val!12962 Int)) )
))
(declare-datatypes ((ValueCell!12208 0))(
  ( (ValueCellFull!12208 (v!15578 V!39565)) (EmptyCell!12208) )
))
(declare-fun mapRest!40441 () (Array (_ BitVec 32) ValueCell!12208))

(declare-datatypes ((array!68621 0))(
  ( (array!68622 (arr!33006 (Array (_ BitVec 32) ValueCell!12208)) (size!33542 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68621)

(declare-fun mapKey!40441 () (_ BitVec 32))

(declare-fun mapValue!40441 () ValueCell!12208)

(assert (=> mapNonEmpty!40441 (= (arr!33006 _values!955) (store mapRest!40441 mapKey!40441 mapValue!40441))))

(declare-fun mapIsEmpty!40441 () Bool)

(assert (=> mapIsEmpty!40441 mapRes!40441))

(declare-fun res!714771 () Bool)

(assert (=> start!94760 (=> (not res!714771) (not e!611829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94760 (= res!714771 (validMask!0 mask!1515))))

(assert (=> start!94760 e!611829))

(assert (=> start!94760 true))

(declare-fun tp_is_empty!25823 () Bool)

(assert (=> start!94760 tp_is_empty!25823))

(declare-fun e!611831 () Bool)

(declare-fun array_inv!25522 (array!68621) Bool)

(assert (=> start!94760 (and (array_inv!25522 _values!955) e!611831)))

(assert (=> start!94760 tp!77497))

(declare-fun array_inv!25523 (array!68619) Bool)

(assert (=> start!94760 (array_inv!25523 _keys!1163)))

(declare-fun b!1071481 () Bool)

(declare-fun e!611826 () Bool)

(assert (=> b!1071481 (= e!611831 (and e!611826 mapRes!40441))))

(declare-fun condMapEmpty!40441 () Bool)

(declare-fun mapDefault!40441 () ValueCell!12208)

