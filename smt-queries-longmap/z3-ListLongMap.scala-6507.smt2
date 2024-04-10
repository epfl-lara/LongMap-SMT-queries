; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82884 () Bool)

(assert start!82884)

(declare-fun b_free!19011 () Bool)

(declare-fun b_next!19011 () Bool)

(assert (=> start!82884 (= b_free!19011 (not b_next!19011))))

(declare-fun tp!66161 () Bool)

(declare-fun b_and!30499 () Bool)

(assert (=> start!82884 (= tp!66161 b_and!30499)))

(declare-fun res!647311 () Bool)

(declare-fun e!545096 () Bool)

(assert (=> start!82884 (=> (not res!647311) (not e!545096))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82884 (= res!647311 (validMask!0 mask!2110))))

(assert (=> start!82884 e!545096))

(assert (=> start!82884 true))

(declare-datatypes ((V!34075 0))(
  ( (V!34076 (val!10960 Int)) )
))
(declare-datatypes ((ValueCell!10428 0))(
  ( (ValueCellFull!10428 (v!13518 V!34075)) (EmptyCell!10428) )
))
(declare-datatypes ((array!59713 0))(
  ( (array!59714 (arr!28725 (Array (_ BitVec 32) ValueCell!10428)) (size!29204 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59713)

(declare-fun e!545092 () Bool)

(declare-fun array_inv!22247 (array!59713) Bool)

(assert (=> start!82884 (and (array_inv!22247 _values!1400) e!545092)))

(declare-datatypes ((array!59715 0))(
  ( (array!59716 (arr!28726 (Array (_ BitVec 32) (_ BitVec 64))) (size!29205 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59715)

(declare-fun array_inv!22248 (array!59715) Bool)

(assert (=> start!82884 (array_inv!22248 _keys!1686)))

(assert (=> start!82884 tp!66161))

(declare-fun tp_is_empty!21819 () Bool)

(assert (=> start!82884 tp_is_empty!21819))

(declare-fun b!967020 () Bool)

(declare-fun res!647314 () Bool)

(assert (=> b!967020 (=> (not res!647314) (not e!545096))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967020 (= res!647314 (validKeyInArray!0 (select (arr!28726 _keys!1686) i!803)))))

(declare-fun b!967021 () Bool)

(declare-fun e!545095 () Bool)

(assert (=> b!967021 (= e!545095 tp_is_empty!21819)))

(declare-fun mapNonEmpty!34723 () Bool)

(declare-fun mapRes!34723 () Bool)

(declare-fun tp!66162 () Bool)

(declare-fun e!545094 () Bool)

(assert (=> mapNonEmpty!34723 (= mapRes!34723 (and tp!66162 e!545094))))

(declare-fun mapValue!34723 () ValueCell!10428)

(declare-fun mapRest!34723 () (Array (_ BitVec 32) ValueCell!10428))

(declare-fun mapKey!34723 () (_ BitVec 32))

(assert (=> mapNonEmpty!34723 (= (arr!28725 _values!1400) (store mapRest!34723 mapKey!34723 mapValue!34723))))

(declare-fun b!967022 () Bool)

(declare-fun res!647307 () Bool)

(assert (=> b!967022 (=> (not res!647307) (not e!545096))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!967022 (= res!647307 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29205 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29205 _keys!1686))))))

(declare-fun b!967023 () Bool)

(declare-fun res!647310 () Bool)

(assert (=> b!967023 (=> (not res!647310) (not e!545096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59715 (_ BitVec 32)) Bool)

(assert (=> b!967023 (= res!647310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967024 () Bool)

(declare-fun res!647313 () Bool)

(assert (=> b!967024 (=> (not res!647313) (not e!545096))))

(assert (=> b!967024 (= res!647313 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34723 () Bool)

(assert (=> mapIsEmpty!34723 mapRes!34723))

(declare-fun b!967025 () Bool)

(declare-fun res!647312 () Bool)

(assert (=> b!967025 (=> (not res!647312) (not e!545096))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!967025 (= res!647312 (and (= (size!29204 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29205 _keys!1686) (size!29204 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967026 () Bool)

(assert (=> b!967026 (= e!545096 (not true))))

(declare-fun minValue!1342 () V!34075)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34075)

(declare-datatypes ((tuple2!14096 0))(
  ( (tuple2!14097 (_1!7059 (_ BitVec 64)) (_2!7059 V!34075)) )
))
(declare-datatypes ((List!19943 0))(
  ( (Nil!19940) (Cons!19939 (h!21101 tuple2!14096) (t!28306 List!19943)) )
))
(declare-datatypes ((ListLongMap!12793 0))(
  ( (ListLongMap!12794 (toList!6412 List!19943)) )
))
(declare-fun contains!5513 (ListLongMap!12793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3645 (array!59715 array!59713 (_ BitVec 32) (_ BitVec 32) V!34075 V!34075 (_ BitVec 32) Int) ListLongMap!12793)

(assert (=> b!967026 (contains!5513 (getCurrentListMap!3645 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28726 _keys!1686) i!803))))

(declare-datatypes ((Unit!32309 0))(
  ( (Unit!32310) )
))
(declare-fun lt!431383 () Unit!32309)

(declare-fun lemmaInListMapFromThenInFromMinusOne!49 (array!59715 array!59713 (_ BitVec 32) (_ BitVec 32) V!34075 V!34075 (_ BitVec 32) (_ BitVec 32) Int) Unit!32309)

(assert (=> b!967026 (= lt!431383 (lemmaInListMapFromThenInFromMinusOne!49 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967027 () Bool)

(declare-fun res!647309 () Bool)

(assert (=> b!967027 (=> (not res!647309) (not e!545096))))

(declare-datatypes ((List!19944 0))(
  ( (Nil!19941) (Cons!19940 (h!21102 (_ BitVec 64)) (t!28307 List!19944)) )
))
(declare-fun arrayNoDuplicates!0 (array!59715 (_ BitVec 32) List!19944) Bool)

(assert (=> b!967027 (= res!647309 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19941))))

(declare-fun b!967028 () Bool)

(assert (=> b!967028 (= e!545094 tp_is_empty!21819)))

(declare-fun b!967029 () Bool)

(declare-fun res!647308 () Bool)

(assert (=> b!967029 (=> (not res!647308) (not e!545096))))

(assert (=> b!967029 (= res!647308 (contains!5513 (getCurrentListMap!3645 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28726 _keys!1686) i!803)))))

(declare-fun b!967030 () Bool)

(assert (=> b!967030 (= e!545092 (and e!545095 mapRes!34723))))

(declare-fun condMapEmpty!34723 () Bool)

(declare-fun mapDefault!34723 () ValueCell!10428)

(assert (=> b!967030 (= condMapEmpty!34723 (= (arr!28725 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10428)) mapDefault!34723)))))

(assert (= (and start!82884 res!647311) b!967025))

(assert (= (and b!967025 res!647312) b!967023))

(assert (= (and b!967023 res!647310) b!967027))

(assert (= (and b!967027 res!647309) b!967022))

(assert (= (and b!967022 res!647307) b!967020))

(assert (= (and b!967020 res!647314) b!967029))

(assert (= (and b!967029 res!647308) b!967024))

(assert (= (and b!967024 res!647313) b!967026))

(assert (= (and b!967030 condMapEmpty!34723) mapIsEmpty!34723))

(assert (= (and b!967030 (not condMapEmpty!34723)) mapNonEmpty!34723))

(get-info :version)

(assert (= (and mapNonEmpty!34723 ((_ is ValueCellFull!10428) mapValue!34723)) b!967028))

(assert (= (and b!967030 ((_ is ValueCellFull!10428) mapDefault!34723)) b!967021))

(assert (= start!82884 b!967030))

(declare-fun m!895661 () Bool)

(assert (=> b!967027 m!895661))

(declare-fun m!895663 () Bool)

(assert (=> b!967020 m!895663))

(assert (=> b!967020 m!895663))

(declare-fun m!895665 () Bool)

(assert (=> b!967020 m!895665))

(declare-fun m!895667 () Bool)

(assert (=> b!967029 m!895667))

(assert (=> b!967029 m!895663))

(assert (=> b!967029 m!895667))

(assert (=> b!967029 m!895663))

(declare-fun m!895669 () Bool)

(assert (=> b!967029 m!895669))

(declare-fun m!895671 () Bool)

(assert (=> start!82884 m!895671))

(declare-fun m!895673 () Bool)

(assert (=> start!82884 m!895673))

(declare-fun m!895675 () Bool)

(assert (=> start!82884 m!895675))

(declare-fun m!895677 () Bool)

(assert (=> mapNonEmpty!34723 m!895677))

(declare-fun m!895679 () Bool)

(assert (=> b!967026 m!895679))

(assert (=> b!967026 m!895663))

(assert (=> b!967026 m!895679))

(assert (=> b!967026 m!895663))

(declare-fun m!895681 () Bool)

(assert (=> b!967026 m!895681))

(declare-fun m!895683 () Bool)

(assert (=> b!967026 m!895683))

(declare-fun m!895685 () Bool)

(assert (=> b!967023 m!895685))

(check-sat tp_is_empty!21819 (not b_next!19011) b_and!30499 (not start!82884) (not mapNonEmpty!34723) (not b!967026) (not b!967020) (not b!967023) (not b!967027) (not b!967029))
(check-sat b_and!30499 (not b_next!19011))
