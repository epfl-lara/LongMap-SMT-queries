; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82738 () Bool)

(assert start!82738)

(declare-fun b_free!18703 () Bool)

(declare-fun b_next!18703 () Bool)

(assert (=> start!82738 (= b_free!18703 (not b_next!18703))))

(declare-fun tp!65230 () Bool)

(declare-fun b_and!30201 () Bool)

(assert (=> start!82738 (= tp!65230 b_and!30201)))

(declare-fun b!963179 () Bool)

(declare-fun res!644323 () Bool)

(declare-fun e!543242 () Bool)

(assert (=> b!963179 (=> (not res!644323) (not e!543242))))

(declare-datatypes ((array!59124 0))(
  ( (array!59125 (arr!28426 (Array (_ BitVec 32) (_ BitVec 64))) (size!28906 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59124)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963179 (= res!644323 (validKeyInArray!0 (select (arr!28426 _keys!1686) i!803)))))

(declare-fun b!963180 () Bool)

(declare-fun res!644320 () Bool)

(assert (=> b!963180 (=> (not res!644320) (not e!543242))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33657 0))(
  ( (V!33658 (val!10803 Int)) )
))
(declare-datatypes ((ValueCell!10271 0))(
  ( (ValueCellFull!10271 (v!13358 V!33657)) (EmptyCell!10271) )
))
(declare-datatypes ((array!59126 0))(
  ( (array!59127 (arr!28427 (Array (_ BitVec 32) ValueCell!10271)) (size!28907 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59126)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963180 (= res!644320 (and (= (size!28907 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28906 _keys!1686) (size!28907 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963181 () Bool)

(declare-fun res!644325 () Bool)

(assert (=> b!963181 (=> (not res!644325) (not e!543242))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963181 (= res!644325 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28906 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28906 _keys!1686))))))

(declare-fun b!963182 () Bool)

(declare-fun e!543240 () Bool)

(declare-fun e!543241 () Bool)

(declare-fun mapRes!34252 () Bool)

(assert (=> b!963182 (= e!543240 (and e!543241 mapRes!34252))))

(declare-fun condMapEmpty!34252 () Bool)

(declare-fun mapDefault!34252 () ValueCell!10271)

(assert (=> b!963182 (= condMapEmpty!34252 (= (arr!28427 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10271)) mapDefault!34252)))))

(declare-fun mapNonEmpty!34252 () Bool)

(declare-fun tp!65229 () Bool)

(declare-fun e!543238 () Bool)

(assert (=> mapNonEmpty!34252 (= mapRes!34252 (and tp!65229 e!543238))))

(declare-fun mapKey!34252 () (_ BitVec 32))

(declare-fun mapRest!34252 () (Array (_ BitVec 32) ValueCell!10271))

(declare-fun mapValue!34252 () ValueCell!10271)

(assert (=> mapNonEmpty!34252 (= (arr!28427 _values!1400) (store mapRest!34252 mapKey!34252 mapValue!34252))))

(declare-fun b!963183 () Bool)

(declare-fun res!644324 () Bool)

(assert (=> b!963183 (=> (not res!644324) (not e!543242))))

(declare-datatypes ((List!19705 0))(
  ( (Nil!19702) (Cons!19701 (h!20869 (_ BitVec 64)) (t!28060 List!19705)) )
))
(declare-fun arrayNoDuplicates!0 (array!59124 (_ BitVec 32) List!19705) Bool)

(assert (=> b!963183 (= res!644324 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19702))))

(declare-fun b!963185 () Bool)

(assert (=> b!963185 (= e!543242 false)))

(declare-fun lt!431219 () Bool)

(declare-fun minValue!1342 () V!33657)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33657)

(declare-datatypes ((tuple2!13854 0))(
  ( (tuple2!13855 (_1!6938 (_ BitVec 64)) (_2!6938 V!33657)) )
))
(declare-datatypes ((List!19706 0))(
  ( (Nil!19703) (Cons!19702 (h!20870 tuple2!13854) (t!28061 List!19706)) )
))
(declare-datatypes ((ListLongMap!12553 0))(
  ( (ListLongMap!12554 (toList!6292 List!19706)) )
))
(declare-fun contains!5407 (ListLongMap!12553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3525 (array!59124 array!59126 (_ BitVec 32) (_ BitVec 32) V!33657 V!33657 (_ BitVec 32) Int) ListLongMap!12553)

(assert (=> b!963185 (= lt!431219 (contains!5407 (getCurrentListMap!3525 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28426 _keys!1686) i!803)))))

(declare-fun b!963186 () Bool)

(declare-fun tp_is_empty!21505 () Bool)

(assert (=> b!963186 (= e!543238 tp_is_empty!21505)))

(declare-fun mapIsEmpty!34252 () Bool)

(assert (=> mapIsEmpty!34252 mapRes!34252))

(declare-fun b!963187 () Bool)

(assert (=> b!963187 (= e!543241 tp_is_empty!21505)))

(declare-fun res!644322 () Bool)

(assert (=> start!82738 (=> (not res!644322) (not e!543242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82738 (= res!644322 (validMask!0 mask!2110))))

(assert (=> start!82738 e!543242))

(assert (=> start!82738 true))

(declare-fun array_inv!22097 (array!59126) Bool)

(assert (=> start!82738 (and (array_inv!22097 _values!1400) e!543240)))

(declare-fun array_inv!22098 (array!59124) Bool)

(assert (=> start!82738 (array_inv!22098 _keys!1686)))

(assert (=> start!82738 tp!65230))

(assert (=> start!82738 tp_is_empty!21505))

(declare-fun b!963184 () Bool)

(declare-fun res!644321 () Bool)

(assert (=> b!963184 (=> (not res!644321) (not e!543242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59124 (_ BitVec 32)) Bool)

(assert (=> b!963184 (= res!644321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82738 res!644322) b!963180))

(assert (= (and b!963180 res!644320) b!963184))

(assert (= (and b!963184 res!644321) b!963183))

(assert (= (and b!963183 res!644324) b!963181))

(assert (= (and b!963181 res!644325) b!963179))

(assert (= (and b!963179 res!644323) b!963185))

(assert (= (and b!963182 condMapEmpty!34252) mapIsEmpty!34252))

(assert (= (and b!963182 (not condMapEmpty!34252)) mapNonEmpty!34252))

(get-info :version)

(assert (= (and mapNonEmpty!34252 ((_ is ValueCellFull!10271) mapValue!34252)) b!963186))

(assert (= (and b!963182 ((_ is ValueCellFull!10271) mapDefault!34252)) b!963187))

(assert (= start!82738 b!963182))

(declare-fun m!893263 () Bool)

(assert (=> b!963184 m!893263))

(declare-fun m!893265 () Bool)

(assert (=> b!963179 m!893265))

(assert (=> b!963179 m!893265))

(declare-fun m!893267 () Bool)

(assert (=> b!963179 m!893267))

(declare-fun m!893269 () Bool)

(assert (=> mapNonEmpty!34252 m!893269))

(declare-fun m!893271 () Bool)

(assert (=> b!963185 m!893271))

(assert (=> b!963185 m!893265))

(assert (=> b!963185 m!893271))

(assert (=> b!963185 m!893265))

(declare-fun m!893273 () Bool)

(assert (=> b!963185 m!893273))

(declare-fun m!893275 () Bool)

(assert (=> b!963183 m!893275))

(declare-fun m!893277 () Bool)

(assert (=> start!82738 m!893277))

(declare-fun m!893279 () Bool)

(assert (=> start!82738 m!893279))

(declare-fun m!893281 () Bool)

(assert (=> start!82738 m!893281))

(check-sat (not b!963183) tp_is_empty!21505 (not b!963184) (not start!82738) (not b!963185) (not b_next!18703) (not mapNonEmpty!34252) b_and!30201 (not b!963179))
(check-sat b_and!30201 (not b_next!18703))
