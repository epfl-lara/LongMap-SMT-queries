; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35838 () Bool)

(assert start!35838)

(declare-fun b!360328 () Bool)

(declare-fun res!200414 () Bool)

(declare-fun e!220633 () Bool)

(assert (=> b!360328 (=> (not res!200414) (not e!220633))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360328 (= res!200414 (validKeyInArray!0 k0!1077))))

(declare-fun b!360330 () Bool)

(declare-fun res!200413 () Bool)

(assert (=> b!360330 (=> (not res!200413) (not e!220633))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20140 0))(
  ( (array!20141 (arr!9563 (Array (_ BitVec 32) (_ BitVec 64))) (size!9915 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20140)

(declare-datatypes ((V!12051 0))(
  ( (V!12052 (val!4197 Int)) )
))
(declare-datatypes ((ValueCell!3809 0))(
  ( (ValueCellFull!3809 (v!6392 V!12051)) (EmptyCell!3809) )
))
(declare-datatypes ((array!20142 0))(
  ( (array!20143 (arr!9564 (Array (_ BitVec 32) ValueCell!3809)) (size!9916 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20142)

(assert (=> b!360330 (= res!200413 (and (= (size!9916 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9915 _keys!1456) (size!9916 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360331 () Bool)

(declare-fun res!200415 () Bool)

(assert (=> b!360331 (=> (not res!200415) (not e!220633))))

(declare-datatypes ((List!5401 0))(
  ( (Nil!5398) (Cons!5397 (h!6253 (_ BitVec 64)) (t!10543 List!5401)) )
))
(declare-fun arrayNoDuplicates!0 (array!20140 (_ BitVec 32) List!5401) Bool)

(assert (=> b!360331 (= res!200415 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5398))))

(declare-fun mapIsEmpty!13965 () Bool)

(declare-fun mapRes!13965 () Bool)

(assert (=> mapIsEmpty!13965 mapRes!13965))

(declare-fun b!360332 () Bool)

(declare-fun res!200411 () Bool)

(assert (=> b!360332 (=> (not res!200411) (not e!220633))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360332 (= res!200411 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360333 () Bool)

(declare-fun e!220630 () Bool)

(declare-fun tp_is_empty!8305 () Bool)

(assert (=> b!360333 (= e!220630 tp_is_empty!8305)))

(declare-fun b!360334 () Bool)

(declare-fun res!200410 () Bool)

(assert (=> b!360334 (=> (not res!200410) (not e!220633))))

(assert (=> b!360334 (= res!200410 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9915 _keys!1456))))))

(declare-fun mapNonEmpty!13965 () Bool)

(declare-fun tp!28032 () Bool)

(assert (=> mapNonEmpty!13965 (= mapRes!13965 (and tp!28032 e!220630))))

(declare-fun mapKey!13965 () (_ BitVec 32))

(declare-fun mapValue!13965 () ValueCell!3809)

(declare-fun mapRest!13965 () (Array (_ BitVec 32) ValueCell!3809))

(assert (=> mapNonEmpty!13965 (= (arr!9564 _values!1208) (store mapRest!13965 mapKey!13965 mapValue!13965))))

(declare-fun b!360335 () Bool)

(assert (=> b!360335 (= e!220633 (not true))))

(assert (=> b!360335 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12051)

(declare-datatypes ((Unit!11073 0))(
  ( (Unit!11074) )
))
(declare-fun lt!166463 () Unit!11073)

(declare-fun zeroValue!1150 () V!12051)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!58 (array!20140 array!20142 (_ BitVec 32) (_ BitVec 32) V!12051 V!12051 (_ BitVec 64) (_ BitVec 32)) Unit!11073)

(assert (=> b!360335 (= lt!166463 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!58 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360336 () Bool)

(declare-fun e!220632 () Bool)

(declare-fun e!220631 () Bool)

(assert (=> b!360336 (= e!220632 (and e!220631 mapRes!13965))))

(declare-fun condMapEmpty!13965 () Bool)

(declare-fun mapDefault!13965 () ValueCell!3809)

(assert (=> b!360336 (= condMapEmpty!13965 (= (arr!9564 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3809)) mapDefault!13965)))))

(declare-fun b!360337 () Bool)

(declare-fun res!200416 () Bool)

(assert (=> b!360337 (=> (not res!200416) (not e!220633))))

(assert (=> b!360337 (= res!200416 (not (= (select (arr!9563 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360338 () Bool)

(declare-fun res!200409 () Bool)

(assert (=> b!360338 (=> (not res!200409) (not e!220633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20140 (_ BitVec 32)) Bool)

(assert (=> b!360338 (= res!200409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!200412 () Bool)

(assert (=> start!35838 (=> (not res!200412) (not e!220633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35838 (= res!200412 (validMask!0 mask!1842))))

(assert (=> start!35838 e!220633))

(assert (=> start!35838 tp_is_empty!8305))

(assert (=> start!35838 true))

(declare-fun array_inv!7070 (array!20140) Bool)

(assert (=> start!35838 (array_inv!7070 _keys!1456)))

(declare-fun array_inv!7071 (array!20142) Bool)

(assert (=> start!35838 (and (array_inv!7071 _values!1208) e!220632)))

(declare-fun b!360329 () Bool)

(assert (=> b!360329 (= e!220631 tp_is_empty!8305)))

(assert (= (and start!35838 res!200412) b!360330))

(assert (= (and b!360330 res!200413) b!360338))

(assert (= (and b!360338 res!200409) b!360331))

(assert (= (and b!360331 res!200415) b!360328))

(assert (= (and b!360328 res!200414) b!360334))

(assert (= (and b!360334 res!200410) b!360332))

(assert (= (and b!360332 res!200411) b!360337))

(assert (= (and b!360337 res!200416) b!360335))

(assert (= (and b!360336 condMapEmpty!13965) mapIsEmpty!13965))

(assert (= (and b!360336 (not condMapEmpty!13965)) mapNonEmpty!13965))

(get-info :version)

(assert (= (and mapNonEmpty!13965 ((_ is ValueCellFull!3809) mapValue!13965)) b!360333))

(assert (= (and b!360336 ((_ is ValueCellFull!3809) mapDefault!13965)) b!360329))

(assert (= start!35838 b!360336))

(declare-fun m!357789 () Bool)

(assert (=> b!360335 m!357789))

(declare-fun m!357791 () Bool)

(assert (=> b!360335 m!357791))

(declare-fun m!357793 () Bool)

(assert (=> b!360328 m!357793))

(declare-fun m!357795 () Bool)

(assert (=> start!35838 m!357795))

(declare-fun m!357797 () Bool)

(assert (=> start!35838 m!357797))

(declare-fun m!357799 () Bool)

(assert (=> start!35838 m!357799))

(declare-fun m!357801 () Bool)

(assert (=> b!360331 m!357801))

(declare-fun m!357803 () Bool)

(assert (=> b!360332 m!357803))

(declare-fun m!357805 () Bool)

(assert (=> b!360338 m!357805))

(declare-fun m!357807 () Bool)

(assert (=> b!360337 m!357807))

(declare-fun m!357809 () Bool)

(assert (=> mapNonEmpty!13965 m!357809))

(check-sat (not b!360338) (not b!360332) (not b!360331) tp_is_empty!8305 (not b!360328) (not mapNonEmpty!13965) (not b!360335) (not start!35838))
(check-sat)
