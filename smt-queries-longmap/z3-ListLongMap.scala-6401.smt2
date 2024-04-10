; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82204 () Bool)

(assert start!82204)

(declare-fun b_free!18477 () Bool)

(declare-fun b_next!18477 () Bool)

(assert (=> start!82204 (= b_free!18477 (not b_next!18477))))

(declare-fun tp!64391 () Bool)

(declare-fun b_and!29965 () Bool)

(assert (=> start!82204 (= tp!64391 b_and!29965)))

(declare-fun b!958118 () Bool)

(declare-fun res!641336 () Bool)

(declare-fun e!540147 () Bool)

(assert (=> b!958118 (=> (not res!641336) (not e!540147))))

(declare-datatypes ((array!58469 0))(
  ( (array!58470 (arr!28108 (Array (_ BitVec 32) (_ BitVec 64))) (size!28587 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58469)

(declare-datatypes ((List!19541 0))(
  ( (Nil!19538) (Cons!19537 (h!20699 (_ BitVec 64)) (t!27904 List!19541)) )
))
(declare-fun arrayNoDuplicates!0 (array!58469 (_ BitVec 32) List!19541) Bool)

(assert (=> b!958118 (= res!641336 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19538))))

(declare-fun res!641332 () Bool)

(assert (=> start!82204 (=> (not res!641332) (not e!540147))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82204 (= res!641332 (validMask!0 mask!2088))))

(assert (=> start!82204 e!540147))

(assert (=> start!82204 true))

(declare-fun tp_is_empty!21183 () Bool)

(assert (=> start!82204 tp_is_empty!21183))

(declare-fun array_inv!21805 (array!58469) Bool)

(assert (=> start!82204 (array_inv!21805 _keys!1668)))

(declare-datatypes ((V!33227 0))(
  ( (V!33228 (val!10642 Int)) )
))
(declare-datatypes ((ValueCell!10110 0))(
  ( (ValueCellFull!10110 (v!13199 V!33227)) (EmptyCell!10110) )
))
(declare-datatypes ((array!58471 0))(
  ( (array!58472 (arr!28109 (Array (_ BitVec 32) ValueCell!10110)) (size!28588 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58471)

(declare-fun e!540146 () Bool)

(declare-fun array_inv!21806 (array!58471) Bool)

(assert (=> start!82204 (and (array_inv!21806 _values!1386) e!540146)))

(assert (=> start!82204 tp!64391))

(declare-fun mapIsEmpty!33754 () Bool)

(declare-fun mapRes!33754 () Bool)

(assert (=> mapIsEmpty!33754 mapRes!33754))

(declare-fun b!958119 () Bool)

(declare-fun res!641334 () Bool)

(assert (=> b!958119 (=> (not res!641334) (not e!540147))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958119 (= res!641334 (validKeyInArray!0 (select (arr!28108 _keys!1668) i!793)))))

(declare-fun b!958120 () Bool)

(declare-fun e!540149 () Bool)

(assert (=> b!958120 (= e!540146 (and e!540149 mapRes!33754))))

(declare-fun condMapEmpty!33754 () Bool)

(declare-fun mapDefault!33754 () ValueCell!10110)

(assert (=> b!958120 (= condMapEmpty!33754 (= (arr!28109 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10110)) mapDefault!33754)))))

(declare-fun b!958121 () Bool)

(assert (=> b!958121 (= e!540149 tp_is_empty!21183)))

(declare-fun b!958122 () Bool)

(assert (=> b!958122 (= e!540147 false)))

(declare-fun minValue!1328 () V!33227)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33227)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430407 () Bool)

(declare-datatypes ((tuple2!13720 0))(
  ( (tuple2!13721 (_1!6871 (_ BitVec 64)) (_2!6871 V!33227)) )
))
(declare-datatypes ((List!19542 0))(
  ( (Nil!19539) (Cons!19538 (h!20700 tuple2!13720) (t!27905 List!19542)) )
))
(declare-datatypes ((ListLongMap!12417 0))(
  ( (ListLongMap!12418 (toList!6224 List!19542)) )
))
(declare-fun contains!5325 (ListLongMap!12417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3457 (array!58469 array!58471 (_ BitVec 32) (_ BitVec 32) V!33227 V!33227 (_ BitVec 32) Int) ListLongMap!12417)

(assert (=> b!958122 (= lt!430407 (contains!5325 (getCurrentListMap!3457 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28108 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33754 () Bool)

(declare-fun tp!64392 () Bool)

(declare-fun e!540150 () Bool)

(assert (=> mapNonEmpty!33754 (= mapRes!33754 (and tp!64392 e!540150))))

(declare-fun mapValue!33754 () ValueCell!10110)

(declare-fun mapRest!33754 () (Array (_ BitVec 32) ValueCell!10110))

(declare-fun mapKey!33754 () (_ BitVec 32))

(assert (=> mapNonEmpty!33754 (= (arr!28109 _values!1386) (store mapRest!33754 mapKey!33754 mapValue!33754))))

(declare-fun b!958123 () Bool)

(declare-fun res!641333 () Bool)

(assert (=> b!958123 (=> (not res!641333) (not e!540147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58469 (_ BitVec 32)) Bool)

(assert (=> b!958123 (= res!641333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958124 () Bool)

(declare-fun res!641331 () Bool)

(assert (=> b!958124 (=> (not res!641331) (not e!540147))))

(assert (=> b!958124 (= res!641331 (and (= (size!28588 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28587 _keys!1668) (size!28588 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958125 () Bool)

(declare-fun res!641335 () Bool)

(assert (=> b!958125 (=> (not res!641335) (not e!540147))))

(assert (=> b!958125 (= res!641335 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28587 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28587 _keys!1668))))))

(declare-fun b!958126 () Bool)

(assert (=> b!958126 (= e!540150 tp_is_empty!21183)))

(assert (= (and start!82204 res!641332) b!958124))

(assert (= (and b!958124 res!641331) b!958123))

(assert (= (and b!958123 res!641333) b!958118))

(assert (= (and b!958118 res!641336) b!958125))

(assert (= (and b!958125 res!641335) b!958119))

(assert (= (and b!958119 res!641334) b!958122))

(assert (= (and b!958120 condMapEmpty!33754) mapIsEmpty!33754))

(assert (= (and b!958120 (not condMapEmpty!33754)) mapNonEmpty!33754))

(get-info :version)

(assert (= (and mapNonEmpty!33754 ((_ is ValueCellFull!10110) mapValue!33754)) b!958126))

(assert (= (and b!958120 ((_ is ValueCellFull!10110) mapDefault!33754)) b!958121))

(assert (= start!82204 b!958120))

(declare-fun m!888877 () Bool)

(assert (=> start!82204 m!888877))

(declare-fun m!888879 () Bool)

(assert (=> start!82204 m!888879))

(declare-fun m!888881 () Bool)

(assert (=> start!82204 m!888881))

(declare-fun m!888883 () Bool)

(assert (=> b!958122 m!888883))

(declare-fun m!888885 () Bool)

(assert (=> b!958122 m!888885))

(assert (=> b!958122 m!888883))

(assert (=> b!958122 m!888885))

(declare-fun m!888887 () Bool)

(assert (=> b!958122 m!888887))

(assert (=> b!958119 m!888885))

(assert (=> b!958119 m!888885))

(declare-fun m!888889 () Bool)

(assert (=> b!958119 m!888889))

(declare-fun m!888891 () Bool)

(assert (=> b!958118 m!888891))

(declare-fun m!888893 () Bool)

(assert (=> mapNonEmpty!33754 m!888893))

(declare-fun m!888895 () Bool)

(assert (=> b!958123 m!888895))

(check-sat (not b!958119) b_and!29965 (not b!958118) tp_is_empty!21183 (not start!82204) (not mapNonEmpty!33754) (not b_next!18477) (not b!958123) (not b!958122))
(check-sat b_and!29965 (not b_next!18477))
