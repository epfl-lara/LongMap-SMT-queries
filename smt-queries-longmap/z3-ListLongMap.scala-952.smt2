; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20812 () Bool)

(assert start!20812)

(declare-fun b_free!5461 () Bool)

(declare-fun b_next!5461 () Bool)

(assert (=> start!20812 (= b_free!5461 (not b_next!5461))))

(declare-fun tp!19424 () Bool)

(declare-fun b_and!12181 () Bool)

(assert (=> start!20812 (= tp!19424 b_and!12181)))

(declare-fun b!208433 () Bool)

(declare-fun res!101400 () Bool)

(declare-fun e!135916 () Bool)

(assert (=> b!208433 (=> (not res!101400) (not e!135916))))

(declare-datatypes ((array!9835 0))(
  ( (array!9836 (arr!4667 (Array (_ BitVec 32) (_ BitVec 64))) (size!4993 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9835)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208433 (= res!101400 (= (select (arr!4667 _keys!825) i!601) k0!843))))

(declare-fun b!208434 () Bool)

(declare-fun res!101403 () Bool)

(assert (=> b!208434 (=> (not res!101403) (not e!135916))))

(assert (=> b!208434 (= res!101403 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4993 _keys!825))))))

(declare-fun b!208435 () Bool)

(declare-fun res!101399 () Bool)

(assert (=> b!208435 (=> (not res!101399) (not e!135916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208435 (= res!101399 (validKeyInArray!0 k0!843))))

(declare-fun b!208436 () Bool)

(declare-fun e!135917 () Bool)

(declare-fun e!135914 () Bool)

(declare-fun mapRes!9053 () Bool)

(assert (=> b!208436 (= e!135917 (and e!135914 mapRes!9053))))

(declare-fun condMapEmpty!9053 () Bool)

(declare-datatypes ((V!6745 0))(
  ( (V!6746 (val!2706 Int)) )
))
(declare-datatypes ((ValueCell!2318 0))(
  ( (ValueCellFull!2318 (v!4670 V!6745)) (EmptyCell!2318) )
))
(declare-datatypes ((array!9837 0))(
  ( (array!9838 (arr!4668 (Array (_ BitVec 32) ValueCell!2318)) (size!4994 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9837)

(declare-fun mapDefault!9053 () ValueCell!2318)

(assert (=> b!208436 (= condMapEmpty!9053 (= (arr!4668 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2318)) mapDefault!9053)))))

(declare-fun mapNonEmpty!9053 () Bool)

(declare-fun tp!19423 () Bool)

(declare-fun e!135918 () Bool)

(assert (=> mapNonEmpty!9053 (= mapRes!9053 (and tp!19423 e!135918))))

(declare-fun mapValue!9053 () ValueCell!2318)

(declare-fun mapRest!9053 () (Array (_ BitVec 32) ValueCell!2318))

(declare-fun mapKey!9053 () (_ BitVec 32))

(assert (=> mapNonEmpty!9053 (= (arr!4668 _values!649) (store mapRest!9053 mapKey!9053 mapValue!9053))))

(declare-fun b!208437 () Bool)

(declare-fun res!101405 () Bool)

(assert (=> b!208437 (=> (not res!101405) (not e!135916))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208437 (= res!101405 (and (= (size!4994 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4993 _keys!825) (size!4994 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208439 () Bool)

(declare-fun tp_is_empty!5323 () Bool)

(assert (=> b!208439 (= e!135918 tp_is_empty!5323)))

(declare-fun b!208440 () Bool)

(assert (=> b!208440 (= e!135916 false)))

(declare-fun v!520 () V!6745)

(declare-datatypes ((tuple2!4076 0))(
  ( (tuple2!4077 (_1!2049 (_ BitVec 64)) (_2!2049 V!6745)) )
))
(declare-datatypes ((List!2984 0))(
  ( (Nil!2981) (Cons!2980 (h!3622 tuple2!4076) (t!7906 List!2984)) )
))
(declare-datatypes ((ListLongMap!2979 0))(
  ( (ListLongMap!2980 (toList!1505 List!2984)) )
))
(declare-fun lt!106634 () ListLongMap!2979)

(declare-fun zeroValue!615 () V!6745)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6745)

(declare-fun getCurrentListMapNoExtraKeys!456 (array!9835 array!9837 (_ BitVec 32) (_ BitVec 32) V!6745 V!6745 (_ BitVec 32) Int) ListLongMap!2979)

(assert (=> b!208440 (= lt!106634 (getCurrentListMapNoExtraKeys!456 _keys!825 (array!9838 (store (arr!4668 _values!649) i!601 (ValueCellFull!2318 v!520)) (size!4994 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106633 () ListLongMap!2979)

(assert (=> b!208440 (= lt!106633 (getCurrentListMapNoExtraKeys!456 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208441 () Bool)

(assert (=> b!208441 (= e!135914 tp_is_empty!5323)))

(declare-fun b!208438 () Bool)

(declare-fun res!101401 () Bool)

(assert (=> b!208438 (=> (not res!101401) (not e!135916))))

(declare-datatypes ((List!2985 0))(
  ( (Nil!2982) (Cons!2981 (h!3623 (_ BitVec 64)) (t!7907 List!2985)) )
))
(declare-fun arrayNoDuplicates!0 (array!9835 (_ BitVec 32) List!2985) Bool)

(assert (=> b!208438 (= res!101401 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2982))))

(declare-fun res!101404 () Bool)

(assert (=> start!20812 (=> (not res!101404) (not e!135916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20812 (= res!101404 (validMask!0 mask!1149))))

(assert (=> start!20812 e!135916))

(declare-fun array_inv!3067 (array!9837) Bool)

(assert (=> start!20812 (and (array_inv!3067 _values!649) e!135917)))

(assert (=> start!20812 true))

(assert (=> start!20812 tp_is_empty!5323))

(declare-fun array_inv!3068 (array!9835) Bool)

(assert (=> start!20812 (array_inv!3068 _keys!825)))

(assert (=> start!20812 tp!19424))

(declare-fun mapIsEmpty!9053 () Bool)

(assert (=> mapIsEmpty!9053 mapRes!9053))

(declare-fun b!208442 () Bool)

(declare-fun res!101402 () Bool)

(assert (=> b!208442 (=> (not res!101402) (not e!135916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9835 (_ BitVec 32)) Bool)

(assert (=> b!208442 (= res!101402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20812 res!101404) b!208437))

(assert (= (and b!208437 res!101405) b!208442))

(assert (= (and b!208442 res!101402) b!208438))

(assert (= (and b!208438 res!101401) b!208434))

(assert (= (and b!208434 res!101403) b!208435))

(assert (= (and b!208435 res!101399) b!208433))

(assert (= (and b!208433 res!101400) b!208440))

(assert (= (and b!208436 condMapEmpty!9053) mapIsEmpty!9053))

(assert (= (and b!208436 (not condMapEmpty!9053)) mapNonEmpty!9053))

(get-info :version)

(assert (= (and mapNonEmpty!9053 ((_ is ValueCellFull!2318) mapValue!9053)) b!208439))

(assert (= (and b!208436 ((_ is ValueCellFull!2318) mapDefault!9053)) b!208441))

(assert (= start!20812 b!208436))

(declare-fun m!235557 () Bool)

(assert (=> start!20812 m!235557))

(declare-fun m!235559 () Bool)

(assert (=> start!20812 m!235559))

(declare-fun m!235561 () Bool)

(assert (=> start!20812 m!235561))

(declare-fun m!235563 () Bool)

(assert (=> b!208438 m!235563))

(declare-fun m!235565 () Bool)

(assert (=> mapNonEmpty!9053 m!235565))

(declare-fun m!235567 () Bool)

(assert (=> b!208433 m!235567))

(declare-fun m!235569 () Bool)

(assert (=> b!208435 m!235569))

(declare-fun m!235571 () Bool)

(assert (=> b!208442 m!235571))

(declare-fun m!235573 () Bool)

(assert (=> b!208440 m!235573))

(declare-fun m!235575 () Bool)

(assert (=> b!208440 m!235575))

(declare-fun m!235577 () Bool)

(assert (=> b!208440 m!235577))

(check-sat (not b!208440) (not start!20812) b_and!12181 tp_is_empty!5323 (not b_next!5461) (not mapNonEmpty!9053) (not b!208435) (not b!208442) (not b!208438))
(check-sat b_and!12181 (not b_next!5461))
