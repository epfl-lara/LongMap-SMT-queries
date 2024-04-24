; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82678 () Bool)

(assert start!82678)

(declare-fun b!962471 () Bool)

(declare-fun e!542792 () Bool)

(declare-fun tp_is_empty!21445 () Bool)

(assert (=> b!962471 (= e!542792 tp_is_empty!21445)))

(declare-fun b!962472 () Bool)

(declare-fun e!542791 () Bool)

(declare-fun mapRes!34162 () Bool)

(assert (=> b!962472 (= e!542791 (and e!542792 mapRes!34162))))

(declare-fun condMapEmpty!34162 () Bool)

(declare-datatypes ((V!33577 0))(
  ( (V!33578 (val!10773 Int)) )
))
(declare-datatypes ((ValueCell!10241 0))(
  ( (ValueCellFull!10241 (v!13328 V!33577)) (EmptyCell!10241) )
))
(declare-datatypes ((array!59012 0))(
  ( (array!59013 (arr!28370 (Array (_ BitVec 32) ValueCell!10241)) (size!28850 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59012)

(declare-fun mapDefault!34162 () ValueCell!10241)

(assert (=> b!962472 (= condMapEmpty!34162 (= (arr!28370 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10241)) mapDefault!34162)))))

(declare-fun mapNonEmpty!34162 () Bool)

(declare-fun tp!65092 () Bool)

(declare-fun e!542790 () Bool)

(assert (=> mapNonEmpty!34162 (= mapRes!34162 (and tp!65092 e!542790))))

(declare-fun mapKey!34162 () (_ BitVec 32))

(declare-fun mapValue!34162 () ValueCell!10241)

(declare-fun mapRest!34162 () (Array (_ BitVec 32) ValueCell!10241))

(assert (=> mapNonEmpty!34162 (= (arr!28370 _values!1400) (store mapRest!34162 mapKey!34162 mapValue!34162))))

(declare-fun b!962473 () Bool)

(assert (=> b!962473 (= e!542790 tp_is_empty!21445)))

(declare-fun res!643882 () Bool)

(declare-fun e!542789 () Bool)

(assert (=> start!82678 (=> (not res!643882) (not e!542789))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82678 (= res!643882 (validMask!0 mask!2110))))

(assert (=> start!82678 e!542789))

(assert (=> start!82678 true))

(declare-fun array_inv!22059 (array!59012) Bool)

(assert (=> start!82678 (and (array_inv!22059 _values!1400) e!542791)))

(declare-datatypes ((array!59014 0))(
  ( (array!59015 (arr!28371 (Array (_ BitVec 32) (_ BitVec 64))) (size!28851 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59014)

(declare-fun array_inv!22060 (array!59014) Bool)

(assert (=> start!82678 (array_inv!22060 _keys!1686)))

(declare-fun b!962474 () Bool)

(declare-fun res!643883 () Bool)

(assert (=> b!962474 (=> (not res!643883) (not e!542789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59014 (_ BitVec 32)) Bool)

(assert (=> b!962474 (= res!643883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962475 () Bool)

(assert (=> b!962475 (= e!542789 false)))

(declare-fun lt!431138 () Bool)

(declare-datatypes ((List!19673 0))(
  ( (Nil!19670) (Cons!19669 (h!20837 (_ BitVec 64)) (t!28028 List!19673)) )
))
(declare-fun arrayNoDuplicates!0 (array!59014 (_ BitVec 32) List!19673) Bool)

(assert (=> b!962475 (= lt!431138 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19670))))

(declare-fun b!962476 () Bool)

(declare-fun res!643884 () Bool)

(assert (=> b!962476 (=> (not res!643884) (not e!542789))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962476 (= res!643884 (and (= (size!28850 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28851 _keys!1686) (size!28850 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34162 () Bool)

(assert (=> mapIsEmpty!34162 mapRes!34162))

(assert (= (and start!82678 res!643882) b!962476))

(assert (= (and b!962476 res!643884) b!962474))

(assert (= (and b!962474 res!643883) b!962475))

(assert (= (and b!962472 condMapEmpty!34162) mapIsEmpty!34162))

(assert (= (and b!962472 (not condMapEmpty!34162)) mapNonEmpty!34162))

(get-info :version)

(assert (= (and mapNonEmpty!34162 ((_ is ValueCellFull!10241) mapValue!34162)) b!962473))

(assert (= (and b!962472 ((_ is ValueCellFull!10241) mapDefault!34162)) b!962471))

(assert (= start!82678 b!962472))

(declare-fun m!892771 () Bool)

(assert (=> mapNonEmpty!34162 m!892771))

(declare-fun m!892773 () Bool)

(assert (=> start!82678 m!892773))

(declare-fun m!892775 () Bool)

(assert (=> start!82678 m!892775))

(declare-fun m!892777 () Bool)

(assert (=> start!82678 m!892777))

(declare-fun m!892779 () Bool)

(assert (=> b!962474 m!892779))

(declare-fun m!892781 () Bool)

(assert (=> b!962475 m!892781))

(check-sat (not b!962475) (not mapNonEmpty!34162) tp_is_empty!21445 (not start!82678) (not b!962474))
(check-sat)
