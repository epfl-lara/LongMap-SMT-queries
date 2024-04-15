; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82576 () Bool)

(assert start!82576)

(declare-fun b_free!18727 () Bool)

(declare-fun b_next!18727 () Bool)

(assert (=> start!82576 (= b_free!18727 (not b_next!18727))))

(declare-fun tp!65301 () Bool)

(declare-fun b_and!30189 () Bool)

(assert (=> start!82576 (= tp!65301 b_and!30189)))

(declare-fun res!644087 () Bool)

(declare-fun e!542690 () Bool)

(assert (=> start!82576 (=> (not res!644087) (not e!542690))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82576 (= res!644087 (validMask!0 mask!2110))))

(assert (=> start!82576 e!542690))

(assert (=> start!82576 true))

(declare-datatypes ((V!33689 0))(
  ( (V!33690 (val!10815 Int)) )
))
(declare-datatypes ((ValueCell!10283 0))(
  ( (ValueCellFull!10283 (v!13372 V!33689)) (EmptyCell!10283) )
))
(declare-datatypes ((array!59084 0))(
  ( (array!59085 (arr!28411 (Array (_ BitVec 32) ValueCell!10283)) (size!28892 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59084)

(declare-fun e!542689 () Bool)

(declare-fun array_inv!22075 (array!59084) Bool)

(assert (=> start!82576 (and (array_inv!22075 _values!1400) e!542689)))

(declare-datatypes ((array!59086 0))(
  ( (array!59087 (arr!28412 (Array (_ BitVec 32) (_ BitVec 64))) (size!28893 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59086)

(declare-fun array_inv!22076 (array!59086) Bool)

(assert (=> start!82576 (array_inv!22076 _keys!1686)))

(assert (=> start!82576 tp!65301))

(declare-fun tp_is_empty!21529 () Bool)

(assert (=> start!82576 tp_is_empty!21529))

(declare-fun mapIsEmpty!34288 () Bool)

(declare-fun mapRes!34288 () Bool)

(assert (=> mapIsEmpty!34288 mapRes!34288))

(declare-fun b!962361 () Bool)

(declare-fun e!542691 () Bool)

(assert (=> b!962361 (= e!542691 tp_is_empty!21529)))

(declare-fun b!962362 () Bool)

(declare-fun e!542688 () Bool)

(assert (=> b!962362 (= e!542689 (and e!542688 mapRes!34288))))

(declare-fun condMapEmpty!34288 () Bool)

(declare-fun mapDefault!34288 () ValueCell!10283)

(assert (=> b!962362 (= condMapEmpty!34288 (= (arr!28411 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10283)) mapDefault!34288)))))

(declare-fun b!962363 () Bool)

(assert (=> b!962363 (= e!542688 tp_is_empty!21529)))

(declare-fun b!962364 () Bool)

(declare-fun res!644083 () Bool)

(assert (=> b!962364 (=> (not res!644083) (not e!542690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59086 (_ BitVec 32)) Bool)

(assert (=> b!962364 (= res!644083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962365 () Bool)

(declare-fun res!644084 () Bool)

(assert (=> b!962365 (=> (not res!644084) (not e!542690))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962365 (= res!644084 (and (= (size!28892 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28893 _keys!1686) (size!28892 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962366 () Bool)

(declare-fun res!644082 () Bool)

(assert (=> b!962366 (=> (not res!644082) (not e!542690))))

(declare-datatypes ((List!19758 0))(
  ( (Nil!19755) (Cons!19754 (h!20916 (_ BitVec 64)) (t!28112 List!19758)) )
))
(declare-fun arrayNoDuplicates!0 (array!59086 (_ BitVec 32) List!19758) Bool)

(assert (=> b!962366 (= res!644082 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19755))))

(declare-fun b!962367 () Bool)

(declare-fun res!644085 () Bool)

(assert (=> b!962367 (=> (not res!644085) (not e!542690))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962367 (= res!644085 (validKeyInArray!0 (select (arr!28412 _keys!1686) i!803)))))

(declare-fun b!962368 () Bool)

(declare-fun res!644086 () Bool)

(assert (=> b!962368 (=> (not res!644086) (not e!542690))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962368 (= res!644086 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28893 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28893 _keys!1686))))))

(declare-fun mapNonEmpty!34288 () Bool)

(declare-fun tp!65302 () Bool)

(assert (=> mapNonEmpty!34288 (= mapRes!34288 (and tp!65302 e!542691))))

(declare-fun mapKey!34288 () (_ BitVec 32))

(declare-fun mapValue!34288 () ValueCell!10283)

(declare-fun mapRest!34288 () (Array (_ BitVec 32) ValueCell!10283))

(assert (=> mapNonEmpty!34288 (= (arr!28411 _values!1400) (store mapRest!34288 mapKey!34288 mapValue!34288))))

(declare-fun b!962369 () Bool)

(assert (=> b!962369 (= e!542690 false)))

(declare-fun lt!430658 () Bool)

(declare-fun minValue!1342 () V!33689)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33689)

(declare-datatypes ((tuple2!13948 0))(
  ( (tuple2!13949 (_1!6985 (_ BitVec 64)) (_2!6985 V!33689)) )
))
(declare-datatypes ((List!19759 0))(
  ( (Nil!19756) (Cons!19755 (h!20917 tuple2!13948) (t!28113 List!19759)) )
))
(declare-datatypes ((ListLongMap!12635 0))(
  ( (ListLongMap!12636 (toList!6333 List!19759)) )
))
(declare-fun contains!5380 (ListLongMap!12635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3495 (array!59086 array!59084 (_ BitVec 32) (_ BitVec 32) V!33689 V!33689 (_ BitVec 32) Int) ListLongMap!12635)

(assert (=> b!962369 (= lt!430658 (contains!5380 (getCurrentListMap!3495 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28412 _keys!1686) i!803)))))

(assert (= (and start!82576 res!644087) b!962365))

(assert (= (and b!962365 res!644084) b!962364))

(assert (= (and b!962364 res!644083) b!962366))

(assert (= (and b!962366 res!644082) b!962368))

(assert (= (and b!962368 res!644086) b!962367))

(assert (= (and b!962367 res!644085) b!962369))

(assert (= (and b!962362 condMapEmpty!34288) mapIsEmpty!34288))

(assert (= (and b!962362 (not condMapEmpty!34288)) mapNonEmpty!34288))

(get-info :version)

(assert (= (and mapNonEmpty!34288 ((_ is ValueCellFull!10283) mapValue!34288)) b!962361))

(assert (= (and b!962362 ((_ is ValueCellFull!10283) mapDefault!34288)) b!962363))

(assert (= start!82576 b!962362))

(declare-fun m!891451 () Bool)

(assert (=> start!82576 m!891451))

(declare-fun m!891453 () Bool)

(assert (=> start!82576 m!891453))

(declare-fun m!891455 () Bool)

(assert (=> start!82576 m!891455))

(declare-fun m!891457 () Bool)

(assert (=> mapNonEmpty!34288 m!891457))

(declare-fun m!891459 () Bool)

(assert (=> b!962367 m!891459))

(assert (=> b!962367 m!891459))

(declare-fun m!891461 () Bool)

(assert (=> b!962367 m!891461))

(declare-fun m!891463 () Bool)

(assert (=> b!962364 m!891463))

(declare-fun m!891465 () Bool)

(assert (=> b!962369 m!891465))

(assert (=> b!962369 m!891459))

(assert (=> b!962369 m!891465))

(assert (=> b!962369 m!891459))

(declare-fun m!891467 () Bool)

(assert (=> b!962369 m!891467))

(declare-fun m!891469 () Bool)

(assert (=> b!962366 m!891469))

(check-sat (not b!962366) (not mapNonEmpty!34288) (not b!962364) (not b!962369) tp_is_empty!21529 (not start!82576) (not b_next!18727) b_and!30189 (not b!962367))
(check-sat b_and!30189 (not b_next!18727))
