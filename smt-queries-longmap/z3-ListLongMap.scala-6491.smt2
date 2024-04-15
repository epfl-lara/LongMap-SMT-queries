; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82768 () Bool)

(assert start!82768)

(declare-fun mapNonEmpty!34576 () Bool)

(declare-fun mapRes!34576 () Bool)

(declare-fun tp!65875 () Bool)

(declare-fun e!544210 () Bool)

(assert (=> mapNonEmpty!34576 (= mapRes!34576 (and tp!65875 e!544210))))

(declare-datatypes ((V!33945 0))(
  ( (V!33946 (val!10911 Int)) )
))
(declare-datatypes ((ValueCell!10379 0))(
  ( (ValueCellFull!10379 (v!13468 V!33945)) (EmptyCell!10379) )
))
(declare-fun mapValue!34576 () ValueCell!10379)

(declare-fun mapKey!34576 () (_ BitVec 32))

(declare-datatypes ((array!59460 0))(
  ( (array!59461 (arr!28599 (Array (_ BitVec 32) ValueCell!10379)) (size!29080 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59460)

(declare-fun mapRest!34576 () (Array (_ BitVec 32) ValueCell!10379))

(assert (=> mapNonEmpty!34576 (= (arr!28599 _values!1400) (store mapRest!34576 mapKey!34576 mapValue!34576))))

(declare-fun res!646274 () Bool)

(declare-fun e!544211 () Bool)

(assert (=> start!82768 (=> (not res!646274) (not e!544211))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82768 (= res!646274 (validMask!0 mask!2110))))

(assert (=> start!82768 e!544211))

(assert (=> start!82768 true))

(declare-fun e!544213 () Bool)

(declare-fun array_inv!22205 (array!59460) Bool)

(assert (=> start!82768 (and (array_inv!22205 _values!1400) e!544213)))

(declare-datatypes ((array!59462 0))(
  ( (array!59463 (arr!28600 (Array (_ BitVec 32) (_ BitVec 64))) (size!29081 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59462)

(declare-fun array_inv!22206 (array!59462) Bool)

(assert (=> start!82768 (array_inv!22206 _keys!1686)))

(declare-fun mapIsEmpty!34576 () Bool)

(assert (=> mapIsEmpty!34576 mapRes!34576))

(declare-fun b!965417 () Bool)

(declare-fun e!544212 () Bool)

(declare-fun tp_is_empty!21721 () Bool)

(assert (=> b!965417 (= e!544212 tp_is_empty!21721)))

(declare-fun b!965418 () Bool)

(declare-fun res!646275 () Bool)

(assert (=> b!965418 (=> (not res!646275) (not e!544211))))

(declare-datatypes ((List!19906 0))(
  ( (Nil!19903) (Cons!19902 (h!21064 (_ BitVec 64)) (t!28260 List!19906)) )
))
(declare-fun arrayNoDuplicates!0 (array!59462 (_ BitVec 32) List!19906) Bool)

(assert (=> b!965418 (= res!646275 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19903))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun b!965419 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965419 (= e!544211 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29081 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29081 _keys!1686)) (bvslt i!803 #b00000000000000000000000000000000)))))

(declare-fun b!965420 () Bool)

(assert (=> b!965420 (= e!544210 tp_is_empty!21721)))

(declare-fun b!965421 () Bool)

(assert (=> b!965421 (= e!544213 (and e!544212 mapRes!34576))))

(declare-fun condMapEmpty!34576 () Bool)

(declare-fun mapDefault!34576 () ValueCell!10379)

(assert (=> b!965421 (= condMapEmpty!34576 (= (arr!28599 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10379)) mapDefault!34576)))))

(declare-fun b!965422 () Bool)

(declare-fun res!646277 () Bool)

(assert (=> b!965422 (=> (not res!646277) (not e!544211))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965422 (= res!646277 (and (= (size!29080 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29081 _keys!1686) (size!29080 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965423 () Bool)

(declare-fun res!646276 () Bool)

(assert (=> b!965423 (=> (not res!646276) (not e!544211))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59462 (_ BitVec 32)) Bool)

(assert (=> b!965423 (= res!646276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82768 res!646274) b!965422))

(assert (= (and b!965422 res!646277) b!965423))

(assert (= (and b!965423 res!646276) b!965418))

(assert (= (and b!965418 res!646275) b!965419))

(assert (= (and b!965421 condMapEmpty!34576) mapIsEmpty!34576))

(assert (= (and b!965421 (not condMapEmpty!34576)) mapNonEmpty!34576))

(get-info :version)

(assert (= (and mapNonEmpty!34576 ((_ is ValueCellFull!10379) mapValue!34576)) b!965420))

(assert (= (and b!965421 ((_ is ValueCellFull!10379) mapDefault!34576)) b!965417))

(assert (= start!82768 b!965421))

(declare-fun m!893911 () Bool)

(assert (=> mapNonEmpty!34576 m!893911))

(declare-fun m!893913 () Bool)

(assert (=> start!82768 m!893913))

(declare-fun m!893915 () Bool)

(assert (=> start!82768 m!893915))

(declare-fun m!893917 () Bool)

(assert (=> start!82768 m!893917))

(declare-fun m!893919 () Bool)

(assert (=> b!965418 m!893919))

(declare-fun m!893921 () Bool)

(assert (=> b!965423 m!893921))

(check-sat (not start!82768) tp_is_empty!21721 (not mapNonEmpty!34576) (not b!965418) (not b!965423))
(check-sat)
