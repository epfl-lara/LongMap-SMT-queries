; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39062 () Bool)

(assert start!39062)

(declare-fun b_free!9343 () Bool)

(declare-fun b_next!9343 () Bool)

(assert (=> start!39062 (= b_free!9343 (not b_next!9343))))

(declare-fun tp!33558 () Bool)

(declare-fun b_and!16703 () Bool)

(assert (=> start!39062 (= tp!33558 b_and!16703)))

(declare-fun b!410051 () Bool)

(declare-fun res!237678 () Bool)

(declare-fun e!245786 () Bool)

(assert (=> b!410051 (=> (not res!237678) (not e!245786))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410051 (= res!237678 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17364 () Bool)

(declare-fun mapRes!17364 () Bool)

(assert (=> mapIsEmpty!17364 mapRes!17364))

(declare-fun b!410052 () Bool)

(declare-fun e!245789 () Bool)

(assert (=> b!410052 (= e!245786 e!245789)))

(declare-fun res!237671 () Bool)

(assert (=> b!410052 (=> (not res!237671) (not e!245789))))

(declare-datatypes ((array!24847 0))(
  ( (array!24848 (arr!11873 (Array (_ BitVec 32) (_ BitVec 64))) (size!12226 (_ BitVec 32))) )
))
(declare-fun lt!188831 () array!24847)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24847 (_ BitVec 32)) Bool)

(assert (=> b!410052 (= res!237671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188831 mask!1025))))

(declare-fun _keys!709 () array!24847)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410052 (= lt!188831 (array!24848 (store (arr!11873 _keys!709) i!563 k0!794) (size!12226 _keys!709)))))

(declare-fun res!237668 () Bool)

(assert (=> start!39062 (=> (not res!237668) (not e!245786))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39062 (= res!237668 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12226 _keys!709))))))

(assert (=> start!39062 e!245786))

(declare-fun tp_is_empty!10495 () Bool)

(assert (=> start!39062 tp_is_empty!10495))

(assert (=> start!39062 tp!33558))

(assert (=> start!39062 true))

(declare-datatypes ((V!15099 0))(
  ( (V!15100 (val!5292 Int)) )
))
(declare-datatypes ((ValueCell!4904 0))(
  ( (ValueCellFull!4904 (v!7533 V!15099)) (EmptyCell!4904) )
))
(declare-datatypes ((array!24849 0))(
  ( (array!24850 (arr!11874 (Array (_ BitVec 32) ValueCell!4904)) (size!12227 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24849)

(declare-fun e!245785 () Bool)

(declare-fun array_inv!8706 (array!24849) Bool)

(assert (=> start!39062 (and (array_inv!8706 _values!549) e!245785)))

(declare-fun array_inv!8707 (array!24847) Bool)

(assert (=> start!39062 (array_inv!8707 _keys!709)))

(declare-fun mapNonEmpty!17364 () Bool)

(declare-fun tp!33557 () Bool)

(declare-fun e!245790 () Bool)

(assert (=> mapNonEmpty!17364 (= mapRes!17364 (and tp!33557 e!245790))))

(declare-fun mapRest!17364 () (Array (_ BitVec 32) ValueCell!4904))

(declare-fun mapKey!17364 () (_ BitVec 32))

(declare-fun mapValue!17364 () ValueCell!4904)

(assert (=> mapNonEmpty!17364 (= (arr!11874 _values!549) (store mapRest!17364 mapKey!17364 mapValue!17364))))

(declare-fun b!410053 () Bool)

(declare-fun res!237676 () Bool)

(assert (=> b!410053 (=> (not res!237676) (not e!245786))))

(declare-datatypes ((List!6860 0))(
  ( (Nil!6857) (Cons!6856 (h!7712 (_ BitVec 64)) (t!12025 List!6860)) )
))
(declare-fun arrayNoDuplicates!0 (array!24847 (_ BitVec 32) List!6860) Bool)

(assert (=> b!410053 (= res!237676 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6857))))

(declare-fun b!410054 () Bool)

(declare-fun res!237675 () Bool)

(assert (=> b!410054 (=> (not res!237675) (not e!245789))))

(assert (=> b!410054 (= res!237675 (arrayNoDuplicates!0 lt!188831 #b00000000000000000000000000000000 Nil!6857))))

(declare-fun b!410055 () Bool)

(declare-fun res!237670 () Bool)

(assert (=> b!410055 (=> (not res!237670) (not e!245786))))

(declare-fun arrayContainsKey!0 (array!24847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410055 (= res!237670 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410056 () Bool)

(declare-fun e!245787 () Bool)

(assert (=> b!410056 (= e!245787 tp_is_empty!10495)))

(declare-fun b!410057 () Bool)

(declare-fun res!237667 () Bool)

(assert (=> b!410057 (=> (not res!237667) (not e!245786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410057 (= res!237667 (validMask!0 mask!1025))))

(declare-fun b!410058 () Bool)

(declare-fun res!237672 () Bool)

(assert (=> b!410058 (=> (not res!237672) (not e!245786))))

(assert (=> b!410058 (= res!237672 (or (= (select (arr!11873 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11873 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410059 () Bool)

(declare-fun res!237673 () Bool)

(assert (=> b!410059 (=> (not res!237673) (not e!245786))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410059 (= res!237673 (and (= (size!12227 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12226 _keys!709) (size!12227 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410060 () Bool)

(declare-fun res!237669 () Bool)

(assert (=> b!410060 (=> (not res!237669) (not e!245789))))

(assert (=> b!410060 (= res!237669 (bvsle from!863 i!563))))

(declare-fun b!410061 () Bool)

(assert (=> b!410061 (= e!245789 false)))

(declare-fun minValue!515 () V!15099)

(declare-datatypes ((tuple2!6848 0))(
  ( (tuple2!6849 (_1!3435 (_ BitVec 64)) (_2!3435 V!15099)) )
))
(declare-datatypes ((List!6861 0))(
  ( (Nil!6858) (Cons!6857 (h!7713 tuple2!6848) (t!12026 List!6861)) )
))
(declare-datatypes ((ListLongMap!5751 0))(
  ( (ListLongMap!5752 (toList!2891 List!6861)) )
))
(declare-fun lt!188830 () ListLongMap!5751)

(declare-fun zeroValue!515 () V!15099)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1105 (array!24847 array!24849 (_ BitVec 32) (_ BitVec 32) V!15099 V!15099 (_ BitVec 32) Int) ListLongMap!5751)

(assert (=> b!410061 (= lt!188830 (getCurrentListMapNoExtraKeys!1105 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410062 () Bool)

(assert (=> b!410062 (= e!245785 (and e!245787 mapRes!17364))))

(declare-fun condMapEmpty!17364 () Bool)

(declare-fun mapDefault!17364 () ValueCell!4904)

(assert (=> b!410062 (= condMapEmpty!17364 (= (arr!11874 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4904)) mapDefault!17364)))))

(declare-fun b!410063 () Bool)

(assert (=> b!410063 (= e!245790 tp_is_empty!10495)))

(declare-fun b!410064 () Bool)

(declare-fun res!237677 () Bool)

(assert (=> b!410064 (=> (not res!237677) (not e!245786))))

(assert (=> b!410064 (= res!237677 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12226 _keys!709))))))

(declare-fun b!410065 () Bool)

(declare-fun res!237674 () Bool)

(assert (=> b!410065 (=> (not res!237674) (not e!245786))))

(assert (=> b!410065 (= res!237674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39062 res!237668) b!410057))

(assert (= (and b!410057 res!237667) b!410059))

(assert (= (and b!410059 res!237673) b!410065))

(assert (= (and b!410065 res!237674) b!410053))

(assert (= (and b!410053 res!237676) b!410064))

(assert (= (and b!410064 res!237677) b!410051))

(assert (= (and b!410051 res!237678) b!410058))

(assert (= (and b!410058 res!237672) b!410055))

(assert (= (and b!410055 res!237670) b!410052))

(assert (= (and b!410052 res!237671) b!410054))

(assert (= (and b!410054 res!237675) b!410060))

(assert (= (and b!410060 res!237669) b!410061))

(assert (= (and b!410062 condMapEmpty!17364) mapIsEmpty!17364))

(assert (= (and b!410062 (not condMapEmpty!17364)) mapNonEmpty!17364))

(get-info :version)

(assert (= (and mapNonEmpty!17364 ((_ is ValueCellFull!4904) mapValue!17364)) b!410063))

(assert (= (and b!410062 ((_ is ValueCellFull!4904) mapDefault!17364)) b!410056))

(assert (= start!39062 b!410062))

(declare-fun m!400131 () Bool)

(assert (=> b!410061 m!400131))

(declare-fun m!400133 () Bool)

(assert (=> start!39062 m!400133))

(declare-fun m!400135 () Bool)

(assert (=> start!39062 m!400135))

(declare-fun m!400137 () Bool)

(assert (=> b!410058 m!400137))

(declare-fun m!400139 () Bool)

(assert (=> mapNonEmpty!17364 m!400139))

(declare-fun m!400141 () Bool)

(assert (=> b!410057 m!400141))

(declare-fun m!400143 () Bool)

(assert (=> b!410065 m!400143))

(declare-fun m!400145 () Bool)

(assert (=> b!410051 m!400145))

(declare-fun m!400147 () Bool)

(assert (=> b!410053 m!400147))

(declare-fun m!400149 () Bool)

(assert (=> b!410054 m!400149))

(declare-fun m!400151 () Bool)

(assert (=> b!410055 m!400151))

(declare-fun m!400153 () Bool)

(assert (=> b!410052 m!400153))

(declare-fun m!400155 () Bool)

(assert (=> b!410052 m!400155))

(check-sat b_and!16703 (not b!410055) (not mapNonEmpty!17364) (not b!410057) (not b!410061) (not b!410051) (not b_next!9343) (not b!410052) (not b!410065) (not b!410053) (not start!39062) tp_is_empty!10495 (not b!410054))
(check-sat b_and!16703 (not b_next!9343))
