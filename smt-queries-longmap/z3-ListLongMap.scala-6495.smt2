; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82792 () Bool)

(assert start!82792)

(declare-fun b_free!18937 () Bool)

(declare-fun b_next!18937 () Bool)

(assert (=> start!82792 (= b_free!18937 (not b_next!18937))))

(declare-fun tp!65941 () Bool)

(declare-fun b_and!30399 () Bool)

(assert (=> start!82792 (= tp!65941 b_and!30399)))

(declare-fun b!965727 () Bool)

(declare-fun e!544389 () Bool)

(declare-fun tp_is_empty!21745 () Bool)

(assert (=> b!965727 (= e!544389 tp_is_empty!21745)))

(declare-fun mapIsEmpty!34612 () Bool)

(declare-fun mapRes!34612 () Bool)

(assert (=> mapIsEmpty!34612 mapRes!34612))

(declare-fun b!965729 () Bool)

(declare-fun e!544391 () Bool)

(assert (=> b!965729 (= e!544391 tp_is_empty!21745)))

(declare-fun res!646476 () Bool)

(declare-fun e!544390 () Bool)

(assert (=> start!82792 (=> (not res!646476) (not e!544390))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82792 (= res!646476 (validMask!0 mask!2110))))

(assert (=> start!82792 e!544390))

(assert (=> start!82792 true))

(declare-datatypes ((V!33977 0))(
  ( (V!33978 (val!10923 Int)) )
))
(declare-datatypes ((ValueCell!10391 0))(
  ( (ValueCellFull!10391 (v!13480 V!33977)) (EmptyCell!10391) )
))
(declare-datatypes ((array!59502 0))(
  ( (array!59503 (arr!28620 (Array (_ BitVec 32) ValueCell!10391)) (size!29101 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59502)

(declare-fun e!544393 () Bool)

(declare-fun array_inv!22219 (array!59502) Bool)

(assert (=> start!82792 (and (array_inv!22219 _values!1400) e!544393)))

(declare-datatypes ((array!59504 0))(
  ( (array!59505 (arr!28621 (Array (_ BitVec 32) (_ BitVec 64))) (size!29102 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59504)

(declare-fun array_inv!22220 (array!59504) Bool)

(assert (=> start!82792 (array_inv!22220 _keys!1686)))

(assert (=> start!82792 tp!65941))

(assert (=> start!82792 tp_is_empty!21745))

(declare-fun b!965728 () Bool)

(declare-fun res!646479 () Bool)

(assert (=> b!965728 (=> (not res!646479) (not e!544390))))

(declare-datatypes ((List!19919 0))(
  ( (Nil!19916) (Cons!19915 (h!21077 (_ BitVec 64)) (t!28273 List!19919)) )
))
(declare-fun arrayNoDuplicates!0 (array!59504 (_ BitVec 32) List!19919) Bool)

(assert (=> b!965728 (= res!646479 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19916))))

(declare-fun b!965730 () Bool)

(declare-fun res!646481 () Bool)

(assert (=> b!965730 (=> (not res!646481) (not e!544390))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965730 (= res!646481 (validKeyInArray!0 (select (arr!28621 _keys!1686) i!803)))))

(declare-fun b!965731 () Bool)

(assert (=> b!965731 (= e!544393 (and e!544391 mapRes!34612))))

(declare-fun condMapEmpty!34612 () Bool)

(declare-fun mapDefault!34612 () ValueCell!10391)

(assert (=> b!965731 (= condMapEmpty!34612 (= (arr!28620 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10391)) mapDefault!34612)))))

(declare-fun b!965732 () Bool)

(assert (=> b!965732 (= e!544390 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431045 () Bool)

(declare-fun minValue!1342 () V!33977)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33977)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14114 0))(
  ( (tuple2!14115 (_1!7068 (_ BitVec 64)) (_2!7068 V!33977)) )
))
(declare-datatypes ((List!19920 0))(
  ( (Nil!19917) (Cons!19916 (h!21078 tuple2!14114) (t!28274 List!19920)) )
))
(declare-datatypes ((ListLongMap!12801 0))(
  ( (ListLongMap!12802 (toList!6416 List!19920)) )
))
(declare-fun contains!5461 (ListLongMap!12801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3578 (array!59504 array!59502 (_ BitVec 32) (_ BitVec 32) V!33977 V!33977 (_ BitVec 32) Int) ListLongMap!12801)

(assert (=> b!965732 (= lt!431045 (contains!5461 (getCurrentListMap!3578 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28621 _keys!1686) i!803)))))

(declare-fun b!965733 () Bool)

(declare-fun res!646478 () Bool)

(assert (=> b!965733 (=> (not res!646478) (not e!544390))))

(assert (=> b!965733 (= res!646478 (and (= (size!29101 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29102 _keys!1686) (size!29101 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34612 () Bool)

(declare-fun tp!65940 () Bool)

(assert (=> mapNonEmpty!34612 (= mapRes!34612 (and tp!65940 e!544389))))

(declare-fun mapRest!34612 () (Array (_ BitVec 32) ValueCell!10391))

(declare-fun mapKey!34612 () (_ BitVec 32))

(declare-fun mapValue!34612 () ValueCell!10391)

(assert (=> mapNonEmpty!34612 (= (arr!28620 _values!1400) (store mapRest!34612 mapKey!34612 mapValue!34612))))

(declare-fun b!965734 () Bool)

(declare-fun res!646480 () Bool)

(assert (=> b!965734 (=> (not res!646480) (not e!544390))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965734 (= res!646480 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29102 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29102 _keys!1686))))))

(declare-fun b!965735 () Bool)

(declare-fun res!646477 () Bool)

(assert (=> b!965735 (=> (not res!646477) (not e!544390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59504 (_ BitVec 32)) Bool)

(assert (=> b!965735 (= res!646477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82792 res!646476) b!965733))

(assert (= (and b!965733 res!646478) b!965735))

(assert (= (and b!965735 res!646477) b!965728))

(assert (= (and b!965728 res!646479) b!965734))

(assert (= (and b!965734 res!646480) b!965730))

(assert (= (and b!965730 res!646481) b!965732))

(assert (= (and b!965731 condMapEmpty!34612) mapIsEmpty!34612))

(assert (= (and b!965731 (not condMapEmpty!34612)) mapNonEmpty!34612))

(get-info :version)

(assert (= (and mapNonEmpty!34612 ((_ is ValueCellFull!10391) mapValue!34612)) b!965727))

(assert (= (and b!965731 ((_ is ValueCellFull!10391) mapDefault!34612)) b!965729))

(assert (= start!82792 b!965731))

(declare-fun m!894121 () Bool)

(assert (=> mapNonEmpty!34612 m!894121))

(declare-fun m!894123 () Bool)

(assert (=> start!82792 m!894123))

(declare-fun m!894125 () Bool)

(assert (=> start!82792 m!894125))

(declare-fun m!894127 () Bool)

(assert (=> start!82792 m!894127))

(declare-fun m!894129 () Bool)

(assert (=> b!965728 m!894129))

(declare-fun m!894131 () Bool)

(assert (=> b!965732 m!894131))

(declare-fun m!894133 () Bool)

(assert (=> b!965732 m!894133))

(assert (=> b!965732 m!894131))

(assert (=> b!965732 m!894133))

(declare-fun m!894135 () Bool)

(assert (=> b!965732 m!894135))

(assert (=> b!965730 m!894133))

(assert (=> b!965730 m!894133))

(declare-fun m!894137 () Bool)

(assert (=> b!965730 m!894137))

(declare-fun m!894139 () Bool)

(assert (=> b!965735 m!894139))

(check-sat (not b!965735) (not b!965730) (not mapNonEmpty!34612) tp_is_empty!21745 (not b_next!18937) b_and!30399 (not b!965732) (not b!965728) (not start!82792))
(check-sat b_and!30399 (not b_next!18937))
