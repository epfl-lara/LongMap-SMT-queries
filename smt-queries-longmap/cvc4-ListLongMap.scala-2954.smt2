; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41948 () Bool)

(assert start!41948)

(declare-fun b_free!11537 () Bool)

(declare-fun b_next!11537 () Bool)

(assert (=> start!41948 (= b_free!11537 (not b_next!11537))))

(declare-fun tp!40624 () Bool)

(declare-fun b_and!19925 () Bool)

(assert (=> start!41948 (= tp!40624 b_and!19925)))

(declare-fun b!468350 () Bool)

(declare-fun res!279915 () Bool)

(declare-fun e!274101 () Bool)

(assert (=> b!468350 (=> (not res!279915) (not e!274101))))

(declare-datatypes ((array!29705 0))(
  ( (array!29706 (arr!14279 (Array (_ BitVec 32) (_ BitVec 64))) (size!14631 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29705)

(declare-datatypes ((List!8665 0))(
  ( (Nil!8662) (Cons!8661 (h!9517 (_ BitVec 64)) (t!14621 List!8665)) )
))
(declare-fun arrayNoDuplicates!0 (array!29705 (_ BitVec 32) List!8665) Bool)

(assert (=> b!468350 (= res!279915 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8662))))

(declare-fun b!468351 () Bool)

(declare-fun e!274100 () Bool)

(assert (=> b!468351 (= e!274100 (bvsle #b00000000000000000000000000000000 (size!14631 _keys!1025)))))

(declare-datatypes ((V!18391 0))(
  ( (V!18392 (val!6527 Int)) )
))
(declare-fun minValueBefore!38 () V!18391)

(declare-fun zeroValue!794 () V!18391)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8578 0))(
  ( (tuple2!8579 (_1!4300 (_ BitVec 64)) (_2!4300 V!18391)) )
))
(declare-datatypes ((List!8666 0))(
  ( (Nil!8663) (Cons!8662 (h!9518 tuple2!8578) (t!14622 List!8666)) )
))
(declare-datatypes ((ListLongMap!7491 0))(
  ( (ListLongMap!7492 (toList!3761 List!8666)) )
))
(declare-fun lt!211790 () ListLongMap!7491)

(declare-datatypes ((ValueCell!6139 0))(
  ( (ValueCellFull!6139 (v!8816 V!18391)) (EmptyCell!6139) )
))
(declare-datatypes ((array!29707 0))(
  ( (array!29708 (arr!14280 (Array (_ BitVec 32) ValueCell!6139)) (size!14632 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29707)

(declare-fun getCurrentListMap!2188 (array!29705 array!29707 (_ BitVec 32) (_ BitVec 32) V!18391 V!18391 (_ BitVec 32) Int) ListLongMap!7491)

(assert (=> b!468351 (= lt!211790 (getCurrentListMap!2188 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279912 () Bool)

(assert (=> start!41948 (=> (not res!279912) (not e!274101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41948 (= res!279912 (validMask!0 mask!1365))))

(assert (=> start!41948 e!274101))

(declare-fun tp_is_empty!12965 () Bool)

(assert (=> start!41948 tp_is_empty!12965))

(assert (=> start!41948 tp!40624))

(assert (=> start!41948 true))

(declare-fun array_inv!10310 (array!29705) Bool)

(assert (=> start!41948 (array_inv!10310 _keys!1025)))

(declare-fun e!274105 () Bool)

(declare-fun array_inv!10311 (array!29707) Bool)

(assert (=> start!41948 (and (array_inv!10311 _values!833) e!274105)))

(declare-fun b!468352 () Bool)

(declare-fun e!274104 () Bool)

(assert (=> b!468352 (= e!274104 tp_is_empty!12965)))

(declare-fun mapNonEmpty!21139 () Bool)

(declare-fun mapRes!21139 () Bool)

(declare-fun tp!40623 () Bool)

(declare-fun e!274102 () Bool)

(assert (=> mapNonEmpty!21139 (= mapRes!21139 (and tp!40623 e!274102))))

(declare-fun mapKey!21139 () (_ BitVec 32))

(declare-fun mapValue!21139 () ValueCell!6139)

(declare-fun mapRest!21139 () (Array (_ BitVec 32) ValueCell!6139))

(assert (=> mapNonEmpty!21139 (= (arr!14280 _values!833) (store mapRest!21139 mapKey!21139 mapValue!21139))))

(declare-fun b!468353 () Bool)

(assert (=> b!468353 (= e!274105 (and e!274104 mapRes!21139))))

(declare-fun condMapEmpty!21139 () Bool)

(declare-fun mapDefault!21139 () ValueCell!6139)

