; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82162 () Bool)

(assert start!82162)

(declare-fun mapIsEmpty!33691 () Bool)

(declare-fun mapRes!33691 () Bool)

(assert (=> mapIsEmpty!33691 mapRes!33691))

(declare-fun b!957617 () Bool)

(declare-fun res!641019 () Bool)

(declare-fun e!539834 () Bool)

(assert (=> b!957617 (=> (not res!641019) (not e!539834))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58385 0))(
  ( (array!58386 (arr!28066 (Array (_ BitVec 32) (_ BitVec 64))) (size!28545 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58385)

(declare-datatypes ((V!33171 0))(
  ( (V!33172 (val!10621 Int)) )
))
(declare-datatypes ((ValueCell!10089 0))(
  ( (ValueCellFull!10089 (v!13178 V!33171)) (EmptyCell!10089) )
))
(declare-datatypes ((array!58387 0))(
  ( (array!58388 (arr!28067 (Array (_ BitVec 32) ValueCell!10089)) (size!28546 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58387)

(assert (=> b!957617 (= res!641019 (and (= (size!28546 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28545 _keys!1668) (size!28546 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33691 () Bool)

(declare-fun tp!64296 () Bool)

(declare-fun e!539833 () Bool)

(assert (=> mapNonEmpty!33691 (= mapRes!33691 (and tp!64296 e!539833))))

(declare-fun mapRest!33691 () (Array (_ BitVec 32) ValueCell!10089))

(declare-fun mapKey!33691 () (_ BitVec 32))

(declare-fun mapValue!33691 () ValueCell!10089)

(assert (=> mapNonEmpty!33691 (= (arr!28067 _values!1386) (store mapRest!33691 mapKey!33691 mapValue!33691))))

(declare-fun b!957618 () Bool)

(declare-fun tp_is_empty!21141 () Bool)

(assert (=> b!957618 (= e!539833 tp_is_empty!21141)))

(declare-fun res!641020 () Bool)

(assert (=> start!82162 (=> (not res!641020) (not e!539834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82162 (= res!641020 (validMask!0 mask!2088))))

(assert (=> start!82162 e!539834))

(assert (=> start!82162 true))

(declare-fun e!539835 () Bool)

(declare-fun array_inv!21769 (array!58387) Bool)

(assert (=> start!82162 (and (array_inv!21769 _values!1386) e!539835)))

(declare-fun array_inv!21770 (array!58385) Bool)

(assert (=> start!82162 (array_inv!21770 _keys!1668)))

(declare-fun b!957619 () Bool)

(declare-fun e!539832 () Bool)

(assert (=> b!957619 (= e!539835 (and e!539832 mapRes!33691))))

(declare-fun condMapEmpty!33691 () Bool)

(declare-fun mapDefault!33691 () ValueCell!10089)

(assert (=> b!957619 (= condMapEmpty!33691 (= (arr!28067 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10089)) mapDefault!33691)))))

(declare-fun b!957620 () Bool)

(assert (=> b!957620 (= e!539832 tp_is_empty!21141)))

(declare-fun b!957621 () Bool)

(assert (=> b!957621 (= e!539834 false)))

(declare-fun lt!430353 () Bool)

(declare-datatypes ((List!19517 0))(
  ( (Nil!19514) (Cons!19513 (h!20675 (_ BitVec 64)) (t!27880 List!19517)) )
))
(declare-fun arrayNoDuplicates!0 (array!58385 (_ BitVec 32) List!19517) Bool)

(assert (=> b!957621 (= lt!430353 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19514))))

(declare-fun b!957622 () Bool)

(declare-fun res!641021 () Bool)

(assert (=> b!957622 (=> (not res!641021) (not e!539834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58385 (_ BitVec 32)) Bool)

(assert (=> b!957622 (= res!641021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(assert (= (and start!82162 res!641020) b!957617))

(assert (= (and b!957617 res!641019) b!957622))

(assert (= (and b!957622 res!641021) b!957621))

(assert (= (and b!957619 condMapEmpty!33691) mapIsEmpty!33691))

(assert (= (and b!957619 (not condMapEmpty!33691)) mapNonEmpty!33691))

(get-info :version)

(assert (= (and mapNonEmpty!33691 ((_ is ValueCellFull!10089) mapValue!33691)) b!957618))

(assert (= (and b!957619 ((_ is ValueCellFull!10089) mapDefault!33691)) b!957620))

(assert (= start!82162 b!957619))

(declare-fun m!888533 () Bool)

(assert (=> mapNonEmpty!33691 m!888533))

(declare-fun m!888535 () Bool)

(assert (=> start!82162 m!888535))

(declare-fun m!888537 () Bool)

(assert (=> start!82162 m!888537))

(declare-fun m!888539 () Bool)

(assert (=> start!82162 m!888539))

(declare-fun m!888541 () Bool)

(assert (=> b!957621 m!888541))

(declare-fun m!888543 () Bool)

(assert (=> b!957622 m!888543))

(check-sat tp_is_empty!21141 (not start!82162) (not b!957622) (not mapNonEmpty!33691) (not b!957621))
(check-sat)
