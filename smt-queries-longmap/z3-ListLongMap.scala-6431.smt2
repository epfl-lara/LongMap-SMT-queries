; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82364 () Bool)

(assert start!82364)

(declare-fun b_free!18649 () Bool)

(declare-fun b_next!18649 () Bool)

(assert (=> start!82364 (= b_free!18649 (not b_next!18649))))

(declare-fun tp!64918 () Bool)

(declare-fun b_and!30111 () Bool)

(assert (=> start!82364 (= tp!64918 b_and!30111)))

(declare-fun b!960345 () Bool)

(declare-fun res!642889 () Bool)

(declare-fun e!541337 () Bool)

(assert (=> b!960345 (=> (not res!642889) (not e!541337))))

(declare-datatypes ((array!58748 0))(
  ( (array!58749 (arr!28248 (Array (_ BitVec 32) (_ BitVec 64))) (size!28729 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58748)

(declare-datatypes ((List!19680 0))(
  ( (Nil!19677) (Cons!19676 (h!20838 (_ BitVec 64)) (t!28034 List!19680)) )
))
(declare-fun arrayNoDuplicates!0 (array!58748 (_ BitVec 32) List!19680) Bool)

(assert (=> b!960345 (= res!642889 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19677))))

(declare-fun b!960346 () Bool)

(declare-fun res!642888 () Bool)

(assert (=> b!960346 (=> (not res!642888) (not e!541337))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960346 (= res!642888 (validKeyInArray!0 (select (arr!28248 _keys!1668) i!793)))))

(declare-fun b!960347 () Bool)

(declare-fun res!642890 () Bool)

(assert (=> b!960347 (=> (not res!642890) (not e!541337))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33465 0))(
  ( (V!33466 (val!10731 Int)) )
))
(declare-datatypes ((ValueCell!10199 0))(
  ( (ValueCellFull!10199 (v!13287 V!33465)) (EmptyCell!10199) )
))
(declare-datatypes ((array!58750 0))(
  ( (array!58751 (arr!28249 (Array (_ BitVec 32) ValueCell!10199)) (size!28730 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58750)

(assert (=> b!960347 (= res!642890 (and (= (size!28730 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28729 _keys!1668) (size!28730 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34021 () Bool)

(declare-fun mapRes!34021 () Bool)

(assert (=> mapIsEmpty!34021 mapRes!34021))

(declare-fun b!960348 () Bool)

(declare-fun e!541334 () Bool)

(declare-fun tp_is_empty!21361 () Bool)

(assert (=> b!960348 (= e!541334 tp_is_empty!21361)))

(declare-fun b!960349 () Bool)

(declare-fun e!541333 () Bool)

(assert (=> b!960349 (= e!541333 tp_is_empty!21361)))

(declare-fun mapNonEmpty!34021 () Bool)

(declare-fun tp!64917 () Bool)

(assert (=> mapNonEmpty!34021 (= mapRes!34021 (and tp!64917 e!541334))))

(declare-fun mapKey!34021 () (_ BitVec 32))

(declare-fun mapValue!34021 () ValueCell!10199)

(declare-fun mapRest!34021 () (Array (_ BitVec 32) ValueCell!10199))

(assert (=> mapNonEmpty!34021 (= (arr!28249 _values!1386) (store mapRest!34021 mapKey!34021 mapValue!34021))))

(declare-fun res!642887 () Bool)

(assert (=> start!82364 (=> (not res!642887) (not e!541337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82364 (= res!642887 (validMask!0 mask!2088))))

(assert (=> start!82364 e!541337))

(assert (=> start!82364 true))

(assert (=> start!82364 tp_is_empty!21361))

(declare-fun array_inv!21951 (array!58748) Bool)

(assert (=> start!82364 (array_inv!21951 _keys!1668)))

(declare-fun e!541336 () Bool)

(declare-fun array_inv!21952 (array!58750) Bool)

(assert (=> start!82364 (and (array_inv!21952 _values!1386) e!541336)))

(assert (=> start!82364 tp!64918))

(declare-fun b!960350 () Bool)

(assert (=> b!960350 (= e!541337 false)))

(declare-fun lt!430429 () Bool)

(declare-fun minValue!1328 () V!33465)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33465)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13896 0))(
  ( (tuple2!13897 (_1!6959 (_ BitVec 64)) (_2!6959 V!33465)) )
))
(declare-datatypes ((List!19681 0))(
  ( (Nil!19678) (Cons!19677 (h!20839 tuple2!13896) (t!28035 List!19681)) )
))
(declare-datatypes ((ListLongMap!12583 0))(
  ( (ListLongMap!12584 (toList!6307 List!19681)) )
))
(declare-fun contains!5350 (ListLongMap!12583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3469 (array!58748 array!58750 (_ BitVec 32) (_ BitVec 32) V!33465 V!33465 (_ BitVec 32) Int) ListLongMap!12583)

(assert (=> b!960350 (= lt!430429 (contains!5350 (getCurrentListMap!3469 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28248 _keys!1668) i!793)))))

(declare-fun b!960351 () Bool)

(declare-fun res!642886 () Bool)

(assert (=> b!960351 (=> (not res!642886) (not e!541337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58748 (_ BitVec 32)) Bool)

(assert (=> b!960351 (= res!642886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960352 () Bool)

(assert (=> b!960352 (= e!541336 (and e!541333 mapRes!34021))))

(declare-fun condMapEmpty!34021 () Bool)

(declare-fun mapDefault!34021 () ValueCell!10199)

(assert (=> b!960352 (= condMapEmpty!34021 (= (arr!28249 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10199)) mapDefault!34021)))))

(declare-fun b!960353 () Bool)

(declare-fun res!642891 () Bool)

(assert (=> b!960353 (=> (not res!642891) (not e!541337))))

(assert (=> b!960353 (= res!642891 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28729 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28729 _keys!1668))))))

(assert (= (and start!82364 res!642887) b!960347))

(assert (= (and b!960347 res!642890) b!960351))

(assert (= (and b!960351 res!642886) b!960345))

(assert (= (and b!960345 res!642889) b!960353))

(assert (= (and b!960353 res!642891) b!960346))

(assert (= (and b!960346 res!642888) b!960350))

(assert (= (and b!960352 condMapEmpty!34021) mapIsEmpty!34021))

(assert (= (and b!960352 (not condMapEmpty!34021)) mapNonEmpty!34021))

(get-info :version)

(assert (= (and mapNonEmpty!34021 ((_ is ValueCellFull!10199) mapValue!34021)) b!960348))

(assert (= (and b!960352 ((_ is ValueCellFull!10199) mapDefault!34021)) b!960349))

(assert (= start!82364 b!960352))

(declare-fun m!890031 () Bool)

(assert (=> b!960350 m!890031))

(declare-fun m!890033 () Bool)

(assert (=> b!960350 m!890033))

(assert (=> b!960350 m!890031))

(assert (=> b!960350 m!890033))

(declare-fun m!890035 () Bool)

(assert (=> b!960350 m!890035))

(declare-fun m!890037 () Bool)

(assert (=> start!82364 m!890037))

(declare-fun m!890039 () Bool)

(assert (=> start!82364 m!890039))

(declare-fun m!890041 () Bool)

(assert (=> start!82364 m!890041))

(assert (=> b!960346 m!890033))

(assert (=> b!960346 m!890033))

(declare-fun m!890043 () Bool)

(assert (=> b!960346 m!890043))

(declare-fun m!890045 () Bool)

(assert (=> b!960345 m!890045))

(declare-fun m!890047 () Bool)

(assert (=> mapNonEmpty!34021 m!890047))

(declare-fun m!890049 () Bool)

(assert (=> b!960351 m!890049))

(check-sat b_and!30111 (not mapNonEmpty!34021) (not b!960351) (not start!82364) (not b_next!18649) (not b!960350) (not b!960346) (not b!960345) tp_is_empty!21361)
(check-sat b_and!30111 (not b_next!18649))
