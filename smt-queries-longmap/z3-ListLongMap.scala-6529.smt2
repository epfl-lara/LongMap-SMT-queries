; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83040 () Bool)

(assert start!83040)

(declare-fun res!648496 () Bool)

(declare-fun e!546036 () Bool)

(assert (=> start!83040 (=> (not res!648496) (not e!546036))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83040 (= res!648496 (validMask!0 mask!2147))))

(assert (=> start!83040 e!546036))

(assert (=> start!83040 true))

(declare-datatypes ((V!34249 0))(
  ( (V!34250 (val!11025 Int)) )
))
(declare-datatypes ((ValueCell!10493 0))(
  ( (ValueCellFull!10493 (v!13583 V!34249)) (EmptyCell!10493) )
))
(declare-datatypes ((array!59902 0))(
  ( (array!59903 (arr!28815 (Array (_ BitVec 32) ValueCell!10493)) (size!29296 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59902)

(declare-fun e!546035 () Bool)

(declare-fun array_inv!22371 (array!59902) Bool)

(assert (=> start!83040 (and (array_inv!22371 _values!1425) e!546035)))

(declare-datatypes ((array!59904 0))(
  ( (array!59905 (arr!28816 (Array (_ BitVec 32) (_ BitVec 64))) (size!29297 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59904)

(declare-fun array_inv!22372 (array!59904) Bool)

(assert (=> start!83040 (array_inv!22372 _keys!1717)))

(declare-fun b!968727 () Bool)

(declare-fun res!648494 () Bool)

(assert (=> b!968727 (=> (not res!648494) (not e!546036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59904 (_ BitVec 32)) Bool)

(assert (=> b!968727 (= res!648494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968728 () Bool)

(declare-fun e!546032 () Bool)

(declare-fun tp_is_empty!21949 () Bool)

(assert (=> b!968728 (= e!546032 tp_is_empty!21949)))

(declare-fun mapNonEmpty!34933 () Bool)

(declare-fun mapRes!34933 () Bool)

(declare-fun tp!66502 () Bool)

(assert (=> mapNonEmpty!34933 (= mapRes!34933 (and tp!66502 e!546032))))

(declare-fun mapValue!34933 () ValueCell!10493)

(declare-fun mapKey!34933 () (_ BitVec 32))

(declare-fun mapRest!34933 () (Array (_ BitVec 32) ValueCell!10493))

(assert (=> mapNonEmpty!34933 (= (arr!28815 _values!1425) (store mapRest!34933 mapKey!34933 mapValue!34933))))

(declare-fun b!968729 () Bool)

(declare-fun res!648495 () Bool)

(assert (=> b!968729 (=> (not res!648495) (not e!546036))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968729 (= res!648495 (and (= (size!29296 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29297 _keys!1717) (size!29296 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968730 () Bool)

(assert (=> b!968730 (= e!546036 false)))

(declare-fun lt!431337 () Bool)

(declare-datatypes ((List!20042 0))(
  ( (Nil!20039) (Cons!20038 (h!21200 (_ BitVec 64)) (t!28396 List!20042)) )
))
(declare-fun arrayNoDuplicates!0 (array!59904 (_ BitVec 32) List!20042) Bool)

(assert (=> b!968730 (= lt!431337 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20039))))

(declare-fun b!968731 () Bool)

(declare-fun e!546033 () Bool)

(assert (=> b!968731 (= e!546035 (and e!546033 mapRes!34933))))

(declare-fun condMapEmpty!34933 () Bool)

(declare-fun mapDefault!34933 () ValueCell!10493)

(assert (=> b!968731 (= condMapEmpty!34933 (= (arr!28815 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10493)) mapDefault!34933)))))

(declare-fun b!968732 () Bool)

(assert (=> b!968732 (= e!546033 tp_is_empty!21949)))

(declare-fun mapIsEmpty!34933 () Bool)

(assert (=> mapIsEmpty!34933 mapRes!34933))

(assert (= (and start!83040 res!648496) b!968729))

(assert (= (and b!968729 res!648495) b!968727))

(assert (= (and b!968727 res!648494) b!968730))

(assert (= (and b!968731 condMapEmpty!34933) mapIsEmpty!34933))

(assert (= (and b!968731 (not condMapEmpty!34933)) mapNonEmpty!34933))

(get-info :version)

(assert (= (and mapNonEmpty!34933 ((_ is ValueCellFull!10493) mapValue!34933)) b!968728))

(assert (= (and b!968731 ((_ is ValueCellFull!10493) mapDefault!34933)) b!968732))

(assert (= start!83040 b!968731))

(declare-fun m!896369 () Bool)

(assert (=> start!83040 m!896369))

(declare-fun m!896371 () Bool)

(assert (=> start!83040 m!896371))

(declare-fun m!896373 () Bool)

(assert (=> start!83040 m!896373))

(declare-fun m!896375 () Bool)

(assert (=> b!968727 m!896375))

(declare-fun m!896377 () Bool)

(assert (=> mapNonEmpty!34933 m!896377))

(declare-fun m!896379 () Bool)

(assert (=> b!968730 m!896379))

(check-sat (not mapNonEmpty!34933) (not start!83040) tp_is_empty!21949 (not b!968727) (not b!968730))
(check-sat)
