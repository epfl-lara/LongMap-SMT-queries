; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82906 () Bool)

(assert start!82906)

(declare-fun b_free!18871 () Bool)

(declare-fun b_next!18871 () Bool)

(assert (=> start!82906 (= b_free!18871 (not b_next!18871))))

(declare-fun tp!65734 () Bool)

(declare-fun b_and!30369 () Bool)

(assert (=> start!82906 (= tp!65734 b_and!30369)))

(declare-fun b!965906 () Bool)

(declare-fun e!544580 () Bool)

(declare-fun tp_is_empty!21673 () Bool)

(assert (=> b!965906 (= e!544580 tp_is_empty!21673)))

(declare-fun b!965907 () Bool)

(declare-fun res!646293 () Bool)

(declare-fun e!544579 () Bool)

(assert (=> b!965907 (=> (not res!646293) (not e!544579))))

(declare-datatypes ((array!59450 0))(
  ( (array!59451 (arr!28589 (Array (_ BitVec 32) (_ BitVec 64))) (size!29069 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59450)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59450 (_ BitVec 32)) Bool)

(assert (=> b!965907 (= res!646293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34504 () Bool)

(declare-fun mapRes!34504 () Bool)

(declare-fun tp!65733 () Bool)

(assert (=> mapNonEmpty!34504 (= mapRes!34504 (and tp!65733 e!544580))))

(declare-datatypes ((V!33881 0))(
  ( (V!33882 (val!10887 Int)) )
))
(declare-datatypes ((ValueCell!10355 0))(
  ( (ValueCellFull!10355 (v!13442 V!33881)) (EmptyCell!10355) )
))
(declare-fun mapValue!34504 () ValueCell!10355)

(declare-datatypes ((array!59452 0))(
  ( (array!59453 (arr!28590 (Array (_ BitVec 32) ValueCell!10355)) (size!29070 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59452)

(declare-fun mapRest!34504 () (Array (_ BitVec 32) ValueCell!10355))

(declare-fun mapKey!34504 () (_ BitVec 32))

(assert (=> mapNonEmpty!34504 (= (arr!28590 _values!1400) (store mapRest!34504 mapKey!34504 mapValue!34504))))

(declare-fun b!965908 () Bool)

(declare-fun res!646292 () Bool)

(assert (=> b!965908 (=> (not res!646292) (not e!544579))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965908 (= res!646292 (validKeyInArray!0 (select (arr!28589 _keys!1686) i!803)))))

(declare-fun b!965909 () Bool)

(declare-fun e!544582 () Bool)

(declare-fun e!544581 () Bool)

(assert (=> b!965909 (= e!544582 (and e!544581 mapRes!34504))))

(declare-fun condMapEmpty!34504 () Bool)

(declare-fun mapDefault!34504 () ValueCell!10355)

(assert (=> b!965909 (= condMapEmpty!34504 (= (arr!28590 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10355)) mapDefault!34504)))))

(declare-fun b!965910 () Bool)

(declare-fun res!646291 () Bool)

(assert (=> b!965910 (=> (not res!646291) (not e!544579))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965910 (= res!646291 (and (= (size!29070 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29069 _keys!1686) (size!29070 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965911 () Bool)

(declare-fun res!646294 () Bool)

(assert (=> b!965911 (=> (not res!646294) (not e!544579))))

(declare-datatypes ((List!19828 0))(
  ( (Nil!19825) (Cons!19824 (h!20992 (_ BitVec 64)) (t!28183 List!19828)) )
))
(declare-fun arrayNoDuplicates!0 (array!59450 (_ BitVec 32) List!19828) Bool)

(assert (=> b!965911 (= res!646294 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19825))))

(declare-fun b!965912 () Bool)

(assert (=> b!965912 (= e!544581 tp_is_empty!21673)))

(declare-fun b!965913 () Bool)

(assert (=> b!965913 (= e!544579 false)))

(declare-fun minValue!1342 () V!33881)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431552 () Bool)

(declare-fun zeroValue!1342 () V!33881)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13982 0))(
  ( (tuple2!13983 (_1!7002 (_ BitVec 64)) (_2!7002 V!33881)) )
))
(declare-datatypes ((List!19829 0))(
  ( (Nil!19826) (Cons!19825 (h!20993 tuple2!13982) (t!28184 List!19829)) )
))
(declare-datatypes ((ListLongMap!12681 0))(
  ( (ListLongMap!12682 (toList!6356 List!19829)) )
))
(declare-fun contains!5471 (ListLongMap!12681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3589 (array!59450 array!59452 (_ BitVec 32) (_ BitVec 32) V!33881 V!33881 (_ BitVec 32) Int) ListLongMap!12681)

(assert (=> b!965913 (= lt!431552 (contains!5471 (getCurrentListMap!3589 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28589 _keys!1686) i!803)))))

(declare-fun b!965914 () Bool)

(declare-fun res!646295 () Bool)

(assert (=> b!965914 (=> (not res!646295) (not e!544579))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965914 (= res!646295 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29069 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29069 _keys!1686))))))

(declare-fun res!646296 () Bool)

(assert (=> start!82906 (=> (not res!646296) (not e!544579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82906 (= res!646296 (validMask!0 mask!2110))))

(assert (=> start!82906 e!544579))

(assert (=> start!82906 true))

(declare-fun array_inv!22203 (array!59452) Bool)

(assert (=> start!82906 (and (array_inv!22203 _values!1400) e!544582)))

(declare-fun array_inv!22204 (array!59450) Bool)

(assert (=> start!82906 (array_inv!22204 _keys!1686)))

(assert (=> start!82906 tp!65734))

(assert (=> start!82906 tp_is_empty!21673))

(declare-fun mapIsEmpty!34504 () Bool)

(assert (=> mapIsEmpty!34504 mapRes!34504))

(assert (= (and start!82906 res!646296) b!965910))

(assert (= (and b!965910 res!646291) b!965907))

(assert (= (and b!965907 res!646293) b!965911))

(assert (= (and b!965911 res!646294) b!965914))

(assert (= (and b!965914 res!646295) b!965908))

(assert (= (and b!965908 res!646292) b!965913))

(assert (= (and b!965909 condMapEmpty!34504) mapIsEmpty!34504))

(assert (= (and b!965909 (not condMapEmpty!34504)) mapNonEmpty!34504))

(get-info :version)

(assert (= (and mapNonEmpty!34504 ((_ is ValueCellFull!10355) mapValue!34504)) b!965906))

(assert (= (and b!965909 ((_ is ValueCellFull!10355) mapDefault!34504)) b!965912))

(assert (= start!82906 b!965909))

(declare-fun m!895483 () Bool)

(assert (=> b!965907 m!895483))

(declare-fun m!895485 () Bool)

(assert (=> mapNonEmpty!34504 m!895485))

(declare-fun m!895487 () Bool)

(assert (=> b!965911 m!895487))

(declare-fun m!895489 () Bool)

(assert (=> b!965908 m!895489))

(assert (=> b!965908 m!895489))

(declare-fun m!895491 () Bool)

(assert (=> b!965908 m!895491))

(declare-fun m!895493 () Bool)

(assert (=> start!82906 m!895493))

(declare-fun m!895495 () Bool)

(assert (=> start!82906 m!895495))

(declare-fun m!895497 () Bool)

(assert (=> start!82906 m!895497))

(declare-fun m!895499 () Bool)

(assert (=> b!965913 m!895499))

(assert (=> b!965913 m!895489))

(assert (=> b!965913 m!895499))

(assert (=> b!965913 m!895489))

(declare-fun m!895501 () Bool)

(assert (=> b!965913 m!895501))

(check-sat (not start!82906) b_and!30369 (not mapNonEmpty!34504) (not b!965911) (not b!965908) tp_is_empty!21673 (not b_next!18871) (not b!965913) (not b!965907))
(check-sat b_and!30369 (not b_next!18871))
