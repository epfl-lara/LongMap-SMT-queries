; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83098 () Bool)

(assert start!83098)

(declare-fun b_free!19057 () Bool)

(declare-fun b_next!19057 () Bool)

(assert (=> start!83098 (= b_free!19057 (not b_next!19057))))

(declare-fun tp!66300 () Bool)

(declare-fun b_and!30555 () Bool)

(assert (=> start!83098 (= tp!66300 b_and!30555)))

(declare-fun b!968682 () Bool)

(declare-fun res!648210 () Bool)

(declare-fun e!546020 () Bool)

(assert (=> b!968682 (=> (not res!648210) (not e!546020))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34137 0))(
  ( (V!34138 (val!10983 Int)) )
))
(declare-datatypes ((ValueCell!10451 0))(
  ( (ValueCellFull!10451 (v!13538 V!34137)) (EmptyCell!10451) )
))
(declare-datatypes ((array!59822 0))(
  ( (array!59823 (arr!28775 (Array (_ BitVec 32) ValueCell!10451)) (size!29255 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59822)

(declare-datatypes ((array!59824 0))(
  ( (array!59825 (arr!28776 (Array (_ BitVec 32) (_ BitVec 64))) (size!29256 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59824)

(declare-fun minValue!1342 () V!34137)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34137)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14118 0))(
  ( (tuple2!14119 (_1!7070 (_ BitVec 64)) (_2!7070 V!34137)) )
))
(declare-datatypes ((List!19965 0))(
  ( (Nil!19962) (Cons!19961 (h!21129 tuple2!14118) (t!28320 List!19965)) )
))
(declare-datatypes ((ListLongMap!12817 0))(
  ( (ListLongMap!12818 (toList!6424 List!19965)) )
))
(declare-fun contains!5536 (ListLongMap!12817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3657 (array!59824 array!59822 (_ BitVec 32) (_ BitVec 32) V!34137 V!34137 (_ BitVec 32) Int) ListLongMap!12817)

(assert (=> b!968682 (= res!648210 (contains!5536 (getCurrentListMap!3657 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28776 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34792 () Bool)

(declare-fun mapRes!34792 () Bool)

(declare-fun tp!66301 () Bool)

(declare-fun e!546023 () Bool)

(assert (=> mapNonEmpty!34792 (= mapRes!34792 (and tp!66301 e!546023))))

(declare-fun mapKey!34792 () (_ BitVec 32))

(declare-fun mapValue!34792 () ValueCell!10451)

(declare-fun mapRest!34792 () (Array (_ BitVec 32) ValueCell!10451))

(assert (=> mapNonEmpty!34792 (= (arr!28775 _values!1400) (store mapRest!34792 mapKey!34792 mapValue!34792))))

(declare-fun b!968683 () Bool)

(declare-fun res!648207 () Bool)

(assert (=> b!968683 (=> (not res!648207) (not e!546020))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968683 (= res!648207 (bvsgt from!2084 newFrom!159))))

(declare-fun res!648204 () Bool)

(assert (=> start!83098 (=> (not res!648204) (not e!546020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83098 (= res!648204 (validMask!0 mask!2110))))

(assert (=> start!83098 e!546020))

(assert (=> start!83098 true))

(declare-fun e!546022 () Bool)

(declare-fun array_inv!22337 (array!59822) Bool)

(assert (=> start!83098 (and (array_inv!22337 _values!1400) e!546022)))

(declare-fun array_inv!22338 (array!59824) Bool)

(assert (=> start!83098 (array_inv!22338 _keys!1686)))

(assert (=> start!83098 tp!66300))

(declare-fun tp_is_empty!21865 () Bool)

(assert (=> start!83098 tp_is_empty!21865))

(declare-fun mapIsEmpty!34792 () Bool)

(assert (=> mapIsEmpty!34792 mapRes!34792))

(declare-fun b!968684 () Bool)

(declare-fun res!648203 () Bool)

(assert (=> b!968684 (=> (not res!648203) (not e!546020))))

(declare-datatypes ((List!19966 0))(
  ( (Nil!19963) (Cons!19962 (h!21130 (_ BitVec 64)) (t!28321 List!19966)) )
))
(declare-fun arrayNoDuplicates!0 (array!59824 (_ BitVec 32) List!19966) Bool)

(assert (=> b!968684 (= res!648203 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19963))))

(declare-fun b!968685 () Bool)

(declare-fun res!648206 () Bool)

(assert (=> b!968685 (=> (not res!648206) (not e!546020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59824 (_ BitVec 32)) Bool)

(assert (=> b!968685 (= res!648206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968686 () Bool)

(assert (=> b!968686 (= e!546020 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29256 _keys!1686)) (bvsge i!803 (bvsub from!2084 #b00000000000000000000000000000001)))))))

(assert (=> b!968686 (contains!5536 (getCurrentListMap!3657 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28776 _keys!1686) i!803))))

(declare-datatypes ((Unit!32302 0))(
  ( (Unit!32303) )
))
(declare-fun lt!431813 () Unit!32302)

(declare-fun lemmaInListMapFromThenInFromMinusOne!62 (array!59824 array!59822 (_ BitVec 32) (_ BitVec 32) V!34137 V!34137 (_ BitVec 32) (_ BitVec 32) Int) Unit!32302)

(assert (=> b!968686 (= lt!431813 (lemmaInListMapFromThenInFromMinusOne!62 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968687 () Bool)

(declare-fun res!648209 () Bool)

(assert (=> b!968687 (=> (not res!648209) (not e!546020))))

(assert (=> b!968687 (= res!648209 (and (= (size!29255 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29256 _keys!1686) (size!29255 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968688 () Bool)

(declare-fun res!648205 () Bool)

(assert (=> b!968688 (=> (not res!648205) (not e!546020))))

(assert (=> b!968688 (= res!648205 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29256 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29256 _keys!1686))))))

(declare-fun b!968689 () Bool)

(declare-fun e!546019 () Bool)

(assert (=> b!968689 (= e!546022 (and e!546019 mapRes!34792))))

(declare-fun condMapEmpty!34792 () Bool)

(declare-fun mapDefault!34792 () ValueCell!10451)

(assert (=> b!968689 (= condMapEmpty!34792 (= (arr!28775 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10451)) mapDefault!34792)))))

(declare-fun b!968690 () Bool)

(assert (=> b!968690 (= e!546019 tp_is_empty!21865)))

(declare-fun b!968691 () Bool)

(declare-fun res!648208 () Bool)

(assert (=> b!968691 (=> (not res!648208) (not e!546020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968691 (= res!648208 (validKeyInArray!0 (select (arr!28776 _keys!1686) i!803)))))

(declare-fun b!968692 () Bool)

(assert (=> b!968692 (= e!546023 tp_is_empty!21865)))

(assert (= (and start!83098 res!648204) b!968687))

(assert (= (and b!968687 res!648209) b!968685))

(assert (= (and b!968685 res!648206) b!968684))

(assert (= (and b!968684 res!648203) b!968688))

(assert (= (and b!968688 res!648205) b!968691))

(assert (= (and b!968691 res!648208) b!968682))

(assert (= (and b!968682 res!648210) b!968683))

(assert (= (and b!968683 res!648207) b!968686))

(assert (= (and b!968689 condMapEmpty!34792) mapIsEmpty!34792))

(assert (= (and b!968689 (not condMapEmpty!34792)) mapNonEmpty!34792))

(get-info :version)

(assert (= (and mapNonEmpty!34792 ((_ is ValueCellFull!10451) mapValue!34792)) b!968692))

(assert (= (and b!968689 ((_ is ValueCellFull!10451) mapDefault!34792)) b!968690))

(assert (= start!83098 b!968689))

(declare-fun m!897553 () Bool)

(assert (=> b!968691 m!897553))

(assert (=> b!968691 m!897553))

(declare-fun m!897555 () Bool)

(assert (=> b!968691 m!897555))

(declare-fun m!897557 () Bool)

(assert (=> b!968685 m!897557))

(declare-fun m!897559 () Bool)

(assert (=> mapNonEmpty!34792 m!897559))

(declare-fun m!897561 () Bool)

(assert (=> b!968686 m!897561))

(assert (=> b!968686 m!897553))

(assert (=> b!968686 m!897561))

(assert (=> b!968686 m!897553))

(declare-fun m!897563 () Bool)

(assert (=> b!968686 m!897563))

(declare-fun m!897565 () Bool)

(assert (=> b!968686 m!897565))

(declare-fun m!897567 () Bool)

(assert (=> b!968684 m!897567))

(declare-fun m!897569 () Bool)

(assert (=> start!83098 m!897569))

(declare-fun m!897571 () Bool)

(assert (=> start!83098 m!897571))

(declare-fun m!897573 () Bool)

(assert (=> start!83098 m!897573))

(declare-fun m!897575 () Bool)

(assert (=> b!968682 m!897575))

(assert (=> b!968682 m!897553))

(assert (=> b!968682 m!897575))

(assert (=> b!968682 m!897553))

(declare-fun m!897577 () Bool)

(assert (=> b!968682 m!897577))

(check-sat (not start!83098) (not b!968691) tp_is_empty!21865 (not b!968682) b_and!30555 (not b_next!19057) (not b!968686) (not b!968684) (not mapNonEmpty!34792) (not b!968685))
(check-sat b_and!30555 (not b_next!19057))
