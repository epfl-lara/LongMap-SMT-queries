; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82402 () Bool)

(assert start!82402)

(declare-fun b_free!18669 () Bool)

(declare-fun b_next!18669 () Bool)

(assert (=> start!82402 (= b_free!18669 (not b_next!18669))))

(declare-fun tp!64976 () Bool)

(declare-fun b_and!30157 () Bool)

(assert (=> start!82402 (= tp!64976 b_and!30157)))

(declare-fun res!643195 () Bool)

(declare-fun e!541635 () Bool)

(assert (=> start!82402 (=> (not res!643195) (not e!541635))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82402 (= res!643195 (validMask!0 mask!2088))))

(assert (=> start!82402 e!541635))

(assert (=> start!82402 true))

(declare-fun tp_is_empty!21381 () Bool)

(assert (=> start!82402 tp_is_empty!21381))

(declare-datatypes ((array!58851 0))(
  ( (array!58852 (arr!28299 (Array (_ BitVec 32) (_ BitVec 64))) (size!28778 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58851)

(declare-fun array_inv!21925 (array!58851) Bool)

(assert (=> start!82402 (array_inv!21925 _keys!1668)))

(declare-datatypes ((V!33491 0))(
  ( (V!33492 (val!10741 Int)) )
))
(declare-datatypes ((ValueCell!10209 0))(
  ( (ValueCellFull!10209 (v!13298 V!33491)) (EmptyCell!10209) )
))
(declare-datatypes ((array!58853 0))(
  ( (array!58854 (arr!28300 (Array (_ BitVec 32) ValueCell!10209)) (size!28779 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58853)

(declare-fun e!541632 () Bool)

(declare-fun array_inv!21926 (array!58853) Bool)

(assert (=> start!82402 (and (array_inv!21926 _values!1386) e!541632)))

(assert (=> start!82402 tp!64976))

(declare-fun b!960868 () Bool)

(declare-fun res!643190 () Bool)

(assert (=> b!960868 (=> (not res!643190) (not e!541635))))

(declare-fun minValue!1328 () V!33491)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33491)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13856 0))(
  ( (tuple2!13857 (_1!6939 (_ BitVec 64)) (_2!6939 V!33491)) )
))
(declare-datatypes ((List!19679 0))(
  ( (Nil!19676) (Cons!19675 (h!20837 tuple2!13856) (t!28042 List!19679)) )
))
(declare-datatypes ((ListLongMap!12553 0))(
  ( (ListLongMap!12554 (toList!6292 List!19679)) )
))
(declare-fun contains!5391 (ListLongMap!12553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3525 (array!58851 array!58853 (_ BitVec 32) (_ BitVec 32) V!33491 V!33491 (_ BitVec 32) Int) ListLongMap!12553)

(assert (=> b!960868 (= res!643190 (contains!5391 (getCurrentListMap!3525 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28299 _keys!1668) i!793)))))

(declare-fun b!960869 () Bool)

(declare-fun e!541633 () Bool)

(declare-fun mapRes!34051 () Bool)

(assert (=> b!960869 (= e!541632 (and e!541633 mapRes!34051))))

(declare-fun condMapEmpty!34051 () Bool)

(declare-fun mapDefault!34051 () ValueCell!10209)

(assert (=> b!960869 (= condMapEmpty!34051 (= (arr!28300 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10209)) mapDefault!34051)))))

(declare-fun mapNonEmpty!34051 () Bool)

(declare-fun tp!64977 () Bool)

(declare-fun e!541634 () Bool)

(assert (=> mapNonEmpty!34051 (= mapRes!34051 (and tp!64977 e!541634))))

(declare-fun mapValue!34051 () ValueCell!10209)

(declare-fun mapKey!34051 () (_ BitVec 32))

(declare-fun mapRest!34051 () (Array (_ BitVec 32) ValueCell!10209))

(assert (=> mapNonEmpty!34051 (= (arr!28300 _values!1386) (store mapRest!34051 mapKey!34051 mapValue!34051))))

(declare-fun b!960870 () Bool)

(declare-fun res!643193 () Bool)

(assert (=> b!960870 (=> (not res!643193) (not e!541635))))

(assert (=> b!960870 (= res!643193 (and (= (size!28779 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28778 _keys!1668) (size!28779 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960871 () Bool)

(declare-fun res!643191 () Bool)

(assert (=> b!960871 (=> (not res!643191) (not e!541635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58851 (_ BitVec 32)) Bool)

(assert (=> b!960871 (= res!643191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960872 () Bool)

(declare-fun res!643196 () Bool)

(assert (=> b!960872 (=> (not res!643196) (not e!541635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960872 (= res!643196 (validKeyInArray!0 (select (arr!28299 _keys!1668) i!793)))))

(declare-fun b!960873 () Bool)

(assert (=> b!960873 (= e!541635 (not true))))

(assert (=> b!960873 (contains!5391 (getCurrentListMap!3525 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28299 _keys!1668) i!793))))

(declare-datatypes ((Unit!32203 0))(
  ( (Unit!32204) )
))
(declare-fun lt!430695 () Unit!32203)

(declare-fun lemmaInListMapFromThenInFromSmaller!23 (array!58851 array!58853 (_ BitVec 32) (_ BitVec 32) V!33491 V!33491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32203)

(assert (=> b!960873 (= lt!430695 (lemmaInListMapFromThenInFromSmaller!23 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!960874 () Bool)

(declare-fun res!643194 () Bool)

(assert (=> b!960874 (=> (not res!643194) (not e!541635))))

(assert (=> b!960874 (= res!643194 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28778 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28778 _keys!1668))))))

(declare-fun b!960875 () Bool)

(declare-fun res!643192 () Bool)

(assert (=> b!960875 (=> (not res!643192) (not e!541635))))

(declare-datatypes ((List!19680 0))(
  ( (Nil!19677) (Cons!19676 (h!20838 (_ BitVec 64)) (t!28043 List!19680)) )
))
(declare-fun arrayNoDuplicates!0 (array!58851 (_ BitVec 32) List!19680) Bool)

(assert (=> b!960875 (= res!643192 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19677))))

(declare-fun mapIsEmpty!34051 () Bool)

(assert (=> mapIsEmpty!34051 mapRes!34051))

(declare-fun b!960876 () Bool)

(assert (=> b!960876 (= e!541634 tp_is_empty!21381)))

(declare-fun b!960877 () Bool)

(assert (=> b!960877 (= e!541633 tp_is_empty!21381)))

(assert (= (and start!82402 res!643195) b!960870))

(assert (= (and b!960870 res!643193) b!960871))

(assert (= (and b!960871 res!643191) b!960875))

(assert (= (and b!960875 res!643192) b!960874))

(assert (= (and b!960874 res!643194) b!960872))

(assert (= (and b!960872 res!643196) b!960868))

(assert (= (and b!960868 res!643190) b!960873))

(assert (= (and b!960869 condMapEmpty!34051) mapIsEmpty!34051))

(assert (= (and b!960869 (not condMapEmpty!34051)) mapNonEmpty!34051))

(get-info :version)

(assert (= (and mapNonEmpty!34051 ((_ is ValueCellFull!10209) mapValue!34051)) b!960876))

(assert (= (and b!960869 ((_ is ValueCellFull!10209) mapDefault!34051)) b!960877))

(assert (= start!82402 b!960869))

(declare-fun m!891013 () Bool)

(assert (=> b!960868 m!891013))

(declare-fun m!891015 () Bool)

(assert (=> b!960868 m!891015))

(assert (=> b!960868 m!891013))

(assert (=> b!960868 m!891015))

(declare-fun m!891017 () Bool)

(assert (=> b!960868 m!891017))

(declare-fun m!891019 () Bool)

(assert (=> b!960873 m!891019))

(assert (=> b!960873 m!891015))

(assert (=> b!960873 m!891019))

(assert (=> b!960873 m!891015))

(declare-fun m!891021 () Bool)

(assert (=> b!960873 m!891021))

(declare-fun m!891023 () Bool)

(assert (=> b!960873 m!891023))

(declare-fun m!891025 () Bool)

(assert (=> b!960871 m!891025))

(declare-fun m!891027 () Bool)

(assert (=> b!960875 m!891027))

(declare-fun m!891029 () Bool)

(assert (=> mapNonEmpty!34051 m!891029))

(declare-fun m!891031 () Bool)

(assert (=> start!82402 m!891031))

(declare-fun m!891033 () Bool)

(assert (=> start!82402 m!891033))

(declare-fun m!891035 () Bool)

(assert (=> start!82402 m!891035))

(assert (=> b!960872 m!891015))

(assert (=> b!960872 m!891015))

(declare-fun m!891037 () Bool)

(assert (=> b!960872 m!891037))

(check-sat (not b!960868) (not start!82402) b_and!30157 (not b_next!18669) (not b!960875) (not b!960873) (not b!960872) (not b!960871) (not mapNonEmpty!34051) tp_is_empty!21381)
(check-sat b_and!30157 (not b_next!18669))
