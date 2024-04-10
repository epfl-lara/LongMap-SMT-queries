; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82928 () Bool)

(assert start!82928)

(declare-fun b_free!19055 () Bool)

(declare-fun b_next!19055 () Bool)

(assert (=> start!82928 (= b_free!19055 (not b_next!19055))))

(declare-fun tp!66293 () Bool)

(declare-fun b_and!30543 () Bool)

(assert (=> start!82928 (= tp!66293 b_and!30543)))

(declare-fun b!967746 () Bool)

(declare-fun e!545426 () Bool)

(declare-fun tp_is_empty!21863 () Bool)

(assert (=> b!967746 (= e!545426 tp_is_empty!21863)))

(declare-fun res!647839 () Bool)

(declare-fun e!545424 () Bool)

(assert (=> start!82928 (=> (not res!647839) (not e!545424))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82928 (= res!647839 (validMask!0 mask!2110))))

(assert (=> start!82928 e!545424))

(assert (=> start!82928 true))

(declare-datatypes ((V!34133 0))(
  ( (V!34134 (val!10982 Int)) )
))
(declare-datatypes ((ValueCell!10450 0))(
  ( (ValueCellFull!10450 (v!13540 V!34133)) (EmptyCell!10450) )
))
(declare-datatypes ((array!59799 0))(
  ( (array!59800 (arr!28768 (Array (_ BitVec 32) ValueCell!10450)) (size!29247 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59799)

(declare-fun e!545425 () Bool)

(declare-fun array_inv!22273 (array!59799) Bool)

(assert (=> start!82928 (and (array_inv!22273 _values!1400) e!545425)))

(declare-datatypes ((array!59801 0))(
  ( (array!59802 (arr!28769 (Array (_ BitVec 32) (_ BitVec 64))) (size!29248 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59801)

(declare-fun array_inv!22274 (array!59801) Bool)

(assert (=> start!82928 (array_inv!22274 _keys!1686)))

(assert (=> start!82928 tp!66293))

(assert (=> start!82928 tp_is_empty!21863))

(declare-fun b!967747 () Bool)

(declare-fun res!647842 () Bool)

(assert (=> b!967747 (=> (not res!647842) (not e!545424))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967747 (= res!647842 (validKeyInArray!0 (select (arr!28769 _keys!1686) i!803)))))

(declare-fun b!967748 () Bool)

(declare-fun e!545423 () Bool)

(assert (=> b!967748 (= e!545423 tp_is_empty!21863)))

(declare-fun b!967749 () Bool)

(declare-fun res!647838 () Bool)

(assert (=> b!967749 (=> (not res!647838) (not e!545424))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967749 (= res!647838 (and (= (size!29247 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29248 _keys!1686) (size!29247 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34789 () Bool)

(declare-fun mapRes!34789 () Bool)

(assert (=> mapIsEmpty!34789 mapRes!34789))

(declare-fun b!967750 () Bool)

(declare-fun res!647835 () Bool)

(assert (=> b!967750 (=> (not res!647835) (not e!545424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59801 (_ BitVec 32)) Bool)

(assert (=> b!967750 (= res!647835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967751 () Bool)

(declare-fun res!647836 () Bool)

(assert (=> b!967751 (=> (not res!647836) (not e!545424))))

(declare-fun minValue!1342 () V!34133)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34133)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14126 0))(
  ( (tuple2!14127 (_1!7074 (_ BitVec 64)) (_2!7074 V!34133)) )
))
(declare-datatypes ((List!19973 0))(
  ( (Nil!19970) (Cons!19969 (h!21131 tuple2!14126) (t!28336 List!19973)) )
))
(declare-datatypes ((ListLongMap!12823 0))(
  ( (ListLongMap!12824 (toList!6427 List!19973)) )
))
(declare-fun contains!5528 (ListLongMap!12823 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3660 (array!59801 array!59799 (_ BitVec 32) (_ BitVec 32) V!34133 V!34133 (_ BitVec 32) Int) ListLongMap!12823)

(assert (=> b!967751 (= res!647836 (contains!5528 (getCurrentListMap!3660 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28769 _keys!1686) i!803)))))

(declare-fun b!967752 () Bool)

(declare-fun res!647840 () Bool)

(assert (=> b!967752 (=> (not res!647840) (not e!545424))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967752 (= res!647840 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29248 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29248 _keys!1686))))))

(declare-fun mapNonEmpty!34789 () Bool)

(declare-fun tp!66294 () Bool)

(assert (=> mapNonEmpty!34789 (= mapRes!34789 (and tp!66294 e!545423))))

(declare-fun mapValue!34789 () ValueCell!10450)

(declare-fun mapRest!34789 () (Array (_ BitVec 32) ValueCell!10450))

(declare-fun mapKey!34789 () (_ BitVec 32))

(assert (=> mapNonEmpty!34789 (= (arr!28768 _values!1400) (store mapRest!34789 mapKey!34789 mapValue!34789))))

(declare-fun b!967753 () Bool)

(declare-fun res!647837 () Bool)

(assert (=> b!967753 (=> (not res!647837) (not e!545424))))

(assert (=> b!967753 (= res!647837 (bvsgt from!2084 newFrom!159))))

(declare-fun b!967754 () Bool)

(assert (=> b!967754 (= e!545425 (and e!545426 mapRes!34789))))

(declare-fun condMapEmpty!34789 () Bool)

(declare-fun mapDefault!34789 () ValueCell!10450)

