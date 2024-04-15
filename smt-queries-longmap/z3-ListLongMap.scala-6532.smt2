; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83058 () Bool)

(assert start!83058)

(declare-fun mapNonEmpty!34960 () Bool)

(declare-fun mapRes!34960 () Bool)

(declare-fun tp!66529 () Bool)

(declare-fun e!546168 () Bool)

(assert (=> mapNonEmpty!34960 (= mapRes!34960 (and tp!66529 e!546168))))

(declare-datatypes ((V!34273 0))(
  ( (V!34274 (val!11034 Int)) )
))
(declare-datatypes ((ValueCell!10502 0))(
  ( (ValueCellFull!10502 (v!13592 V!34273)) (EmptyCell!10502) )
))
(declare-datatypes ((array!59936 0))(
  ( (array!59937 (arr!28832 (Array (_ BitVec 32) ValueCell!10502)) (size!29313 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59936)

(declare-fun mapValue!34960 () ValueCell!10502)

(declare-fun mapRest!34960 () (Array (_ BitVec 32) ValueCell!10502))

(declare-fun mapKey!34960 () (_ BitVec 32))

(assert (=> mapNonEmpty!34960 (= (arr!28832 _values!1425) (store mapRest!34960 mapKey!34960 mapValue!34960))))

(declare-fun b!968889 () Bool)

(declare-fun tp_is_empty!21967 () Bool)

(assert (=> b!968889 (= e!546168 tp_is_empty!21967)))

(declare-fun res!648575 () Bool)

(declare-fun e!546169 () Bool)

(assert (=> start!83058 (=> (not res!648575) (not e!546169))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83058 (= res!648575 (validMask!0 mask!2147))))

(assert (=> start!83058 e!546169))

(assert (=> start!83058 true))

(declare-fun e!546171 () Bool)

(declare-fun array_inv!22385 (array!59936) Bool)

(assert (=> start!83058 (and (array_inv!22385 _values!1425) e!546171)))

(declare-datatypes ((array!59938 0))(
  ( (array!59939 (arr!28833 (Array (_ BitVec 32) (_ BitVec 64))) (size!29314 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59938)

(declare-fun array_inv!22386 (array!59938) Bool)

(assert (=> start!83058 (array_inv!22386 _keys!1717)))

(declare-fun b!968890 () Bool)

(assert (=> b!968890 (= e!546169 false)))

(declare-fun lt!431364 () Bool)

(declare-datatypes ((List!20048 0))(
  ( (Nil!20045) (Cons!20044 (h!21206 (_ BitVec 64)) (t!28402 List!20048)) )
))
(declare-fun arrayNoDuplicates!0 (array!59938 (_ BitVec 32) List!20048) Bool)

(assert (=> b!968890 (= lt!431364 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20045))))

(declare-fun mapIsEmpty!34960 () Bool)

(assert (=> mapIsEmpty!34960 mapRes!34960))

(declare-fun b!968891 () Bool)

(declare-fun res!648577 () Bool)

(assert (=> b!968891 (=> (not res!648577) (not e!546169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59938 (_ BitVec 32)) Bool)

(assert (=> b!968891 (= res!648577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968892 () Bool)

(declare-fun e!546167 () Bool)

(assert (=> b!968892 (= e!546167 tp_is_empty!21967)))

(declare-fun b!968893 () Bool)

(declare-fun res!648576 () Bool)

(assert (=> b!968893 (=> (not res!648576) (not e!546169))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968893 (= res!648576 (and (= (size!29313 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29314 _keys!1717) (size!29313 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968894 () Bool)

(assert (=> b!968894 (= e!546171 (and e!546167 mapRes!34960))))

(declare-fun condMapEmpty!34960 () Bool)

(declare-fun mapDefault!34960 () ValueCell!10502)

(assert (=> b!968894 (= condMapEmpty!34960 (= (arr!28832 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10502)) mapDefault!34960)))))

(assert (= (and start!83058 res!648575) b!968893))

(assert (= (and b!968893 res!648576) b!968891))

(assert (= (and b!968891 res!648577) b!968890))

(assert (= (and b!968894 condMapEmpty!34960) mapIsEmpty!34960))

(assert (= (and b!968894 (not condMapEmpty!34960)) mapNonEmpty!34960))

(get-info :version)

(assert (= (and mapNonEmpty!34960 ((_ is ValueCellFull!10502) mapValue!34960)) b!968889))

(assert (= (and b!968894 ((_ is ValueCellFull!10502) mapDefault!34960)) b!968892))

(assert (= start!83058 b!968894))

(declare-fun m!896477 () Bool)

(assert (=> mapNonEmpty!34960 m!896477))

(declare-fun m!896479 () Bool)

(assert (=> start!83058 m!896479))

(declare-fun m!896481 () Bool)

(assert (=> start!83058 m!896481))

(declare-fun m!896483 () Bool)

(assert (=> start!83058 m!896483))

(declare-fun m!896485 () Bool)

(assert (=> b!968890 m!896485))

(declare-fun m!896487 () Bool)

(assert (=> b!968891 m!896487))

(check-sat (not mapNonEmpty!34960) (not start!83058) tp_is_empty!21967 (not b!968890) (not b!968891))
(check-sat)
