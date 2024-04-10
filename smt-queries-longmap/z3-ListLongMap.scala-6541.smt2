; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83132 () Bool)

(assert start!83132)

(declare-fun b_free!19125 () Bool)

(declare-fun b_next!19125 () Bool)

(assert (=> start!83132 (= b_free!19125 (not b_next!19125))))

(declare-fun tp!66653 () Bool)

(declare-fun b_and!30613 () Bool)

(assert (=> start!83132 (= tp!66653 b_and!30613)))

(declare-fun b!969782 () Bool)

(declare-fun res!649087 () Bool)

(declare-fun e!546737 () Bool)

(assert (=> b!969782 (=> (not res!649087) (not e!546737))))

(declare-datatypes ((array!60109 0))(
  ( (array!60110 (arr!28918 (Array (_ BitVec 32) (_ BitVec 64))) (size!29397 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60109)

(declare-datatypes ((List!20040 0))(
  ( (Nil!20037) (Cons!20036 (h!21198 (_ BitVec 64)) (t!28403 List!20040)) )
))
(declare-fun arrayNoDuplicates!0 (array!60109 (_ BitVec 32) List!20040) Bool)

(assert (=> b!969782 (= res!649087 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20037))))

(declare-fun b!969783 () Bool)

(declare-fun res!649089 () Bool)

(assert (=> b!969783 (=> (not res!649089) (not e!546737))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60109 (_ BitVec 32)) Bool)

(assert (=> b!969783 (= res!649089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969784 () Bool)

(declare-fun res!649088 () Bool)

(assert (=> b!969784 (=> (not res!649088) (not e!546737))))

(declare-datatypes ((V!34347 0))(
  ( (V!34348 (val!11062 Int)) )
))
(declare-datatypes ((ValueCell!10530 0))(
  ( (ValueCellFull!10530 (v!13621 V!34347)) (EmptyCell!10530) )
))
(declare-datatypes ((array!60111 0))(
  ( (array!60112 (arr!28919 (Array (_ BitVec 32) ValueCell!10530)) (size!29398 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60111)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969784 (= res!649088 (and (= (size!29398 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29397 _keys!1717) (size!29398 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969785 () Bool)

(declare-fun e!546739 () Bool)

(declare-fun e!546738 () Bool)

(declare-fun mapRes!35044 () Bool)

(assert (=> b!969785 (= e!546739 (and e!546738 mapRes!35044))))

(declare-fun condMapEmpty!35044 () Bool)

(declare-fun mapDefault!35044 () ValueCell!10530)

(assert (=> b!969785 (= condMapEmpty!35044 (= (arr!28919 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10530)) mapDefault!35044)))))

(declare-fun b!969786 () Bool)

(declare-fun tp_is_empty!22023 () Bool)

(assert (=> b!969786 (= e!546738 tp_is_empty!22023)))

(declare-fun b!969787 () Bool)

(declare-fun res!649090 () Bool)

(assert (=> b!969787 (=> (not res!649090) (not e!546737))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969787 (= res!649090 (validKeyInArray!0 (select (arr!28918 _keys!1717) i!822)))))

(declare-fun b!969788 () Bool)

(declare-fun e!546736 () Bool)

(assert (=> b!969788 (= e!546736 tp_is_empty!22023)))

(declare-fun b!969789 () Bool)

(declare-fun res!649092 () Bool)

(assert (=> b!969789 (=> (not res!649092) (not e!546737))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!969789 (= res!649092 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29397 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29397 _keys!1717))))))

(declare-fun mapIsEmpty!35044 () Bool)

(assert (=> mapIsEmpty!35044 mapRes!35044))

(declare-fun res!649091 () Bool)

(assert (=> start!83132 (=> (not res!649091) (not e!546737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83132 (= res!649091 (validMask!0 mask!2147))))

(assert (=> start!83132 e!546737))

(assert (=> start!83132 true))

(declare-fun array_inv!22385 (array!60111) Bool)

(assert (=> start!83132 (and (array_inv!22385 _values!1425) e!546739)))

(assert (=> start!83132 tp_is_empty!22023))

(assert (=> start!83132 tp!66653))

(declare-fun array_inv!22386 (array!60109) Bool)

(assert (=> start!83132 (array_inv!22386 _keys!1717)))

(declare-fun mapNonEmpty!35044 () Bool)

(declare-fun tp!66654 () Bool)

(assert (=> mapNonEmpty!35044 (= mapRes!35044 (and tp!66654 e!546736))))

(declare-fun mapKey!35044 () (_ BitVec 32))

(declare-fun mapRest!35044 () (Array (_ BitVec 32) ValueCell!10530))

(declare-fun mapValue!35044 () ValueCell!10530)

(assert (=> mapNonEmpty!35044 (= (arr!28919 _values!1425) (store mapRest!35044 mapKey!35044 mapValue!35044))))

(declare-fun b!969790 () Bool)

(assert (=> b!969790 (= e!546737 false)))

(declare-fun zeroValue!1367 () V!34347)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34347)

(declare-fun lt!431675 () Bool)

(declare-datatypes ((tuple2!14172 0))(
  ( (tuple2!14173 (_1!7097 (_ BitVec 64)) (_2!7097 V!34347)) )
))
(declare-datatypes ((List!20041 0))(
  ( (Nil!20038) (Cons!20037 (h!21199 tuple2!14172) (t!28404 List!20041)) )
))
(declare-datatypes ((ListLongMap!12869 0))(
  ( (ListLongMap!12870 (toList!6450 List!20041)) )
))
(declare-fun contains!5554 (ListLongMap!12869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3683 (array!60109 array!60111 (_ BitVec 32) (_ BitVec 32) V!34347 V!34347 (_ BitVec 32) Int) ListLongMap!12869)

(assert (=> b!969790 (= lt!431675 (contains!5554 (getCurrentListMap!3683 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28918 _keys!1717) i!822)))))

(assert (= (and start!83132 res!649091) b!969784))

(assert (= (and b!969784 res!649088) b!969783))

(assert (= (and b!969783 res!649089) b!969782))

(assert (= (and b!969782 res!649087) b!969789))

(assert (= (and b!969789 res!649092) b!969787))

(assert (= (and b!969787 res!649090) b!969790))

(assert (= (and b!969785 condMapEmpty!35044) mapIsEmpty!35044))

(assert (= (and b!969785 (not condMapEmpty!35044)) mapNonEmpty!35044))

(get-info :version)

(assert (= (and mapNonEmpty!35044 ((_ is ValueCellFull!10530) mapValue!35044)) b!969788))

(assert (= (and b!969785 ((_ is ValueCellFull!10530) mapDefault!35044)) b!969786))

(assert (= start!83132 b!969785))

(declare-fun m!897687 () Bool)

(assert (=> b!969782 m!897687))

(declare-fun m!897689 () Bool)

(assert (=> start!83132 m!897689))

(declare-fun m!897691 () Bool)

(assert (=> start!83132 m!897691))

(declare-fun m!897693 () Bool)

(assert (=> start!83132 m!897693))

(declare-fun m!897695 () Bool)

(assert (=> mapNonEmpty!35044 m!897695))

(declare-fun m!897697 () Bool)

(assert (=> b!969783 m!897697))

(declare-fun m!897699 () Bool)

(assert (=> b!969787 m!897699))

(assert (=> b!969787 m!897699))

(declare-fun m!897701 () Bool)

(assert (=> b!969787 m!897701))

(declare-fun m!897703 () Bool)

(assert (=> b!969790 m!897703))

(assert (=> b!969790 m!897699))

(assert (=> b!969790 m!897703))

(assert (=> b!969790 m!897699))

(declare-fun m!897705 () Bool)

(assert (=> b!969790 m!897705))

(check-sat (not b!969782) (not b_next!19125) b_and!30613 (not start!83132) (not mapNonEmpty!35044) (not b!969787) (not b!969790) tp_is_empty!22023 (not b!969783))
(check-sat b_and!30613 (not b_next!19125))
