; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83096 () Bool)

(assert start!83096)

(declare-fun mapIsEmpty!34990 () Bool)

(declare-fun mapRes!34990 () Bool)

(assert (=> mapIsEmpty!34990 mapRes!34990))

(declare-fun b!969308 () Bool)

(declare-fun e!546465 () Bool)

(declare-fun tp_is_empty!21987 () Bool)

(assert (=> b!969308 (= e!546465 tp_is_empty!21987)))

(declare-fun b!969309 () Bool)

(declare-fun e!546466 () Bool)

(assert (=> b!969309 (= e!546466 false)))

(declare-fun lt!431630 () Bool)

(declare-datatypes ((array!60041 0))(
  ( (array!60042 (arr!28884 (Array (_ BitVec 32) (_ BitVec 64))) (size!29363 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60041)

(declare-datatypes ((List!20023 0))(
  ( (Nil!20020) (Cons!20019 (h!21181 (_ BitVec 64)) (t!28386 List!20023)) )
))
(declare-fun arrayNoDuplicates!0 (array!60041 (_ BitVec 32) List!20023) Bool)

(assert (=> b!969309 (= lt!431630 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20020))))

(declare-fun b!969310 () Bool)

(declare-fun e!546467 () Bool)

(assert (=> b!969310 (= e!546467 (and e!546465 mapRes!34990))))

(declare-fun condMapEmpty!34990 () Bool)

(declare-datatypes ((V!34299 0))(
  ( (V!34300 (val!11044 Int)) )
))
(declare-datatypes ((ValueCell!10512 0))(
  ( (ValueCellFull!10512 (v!13603 V!34299)) (EmptyCell!10512) )
))
(declare-datatypes ((array!60043 0))(
  ( (array!60044 (arr!28885 (Array (_ BitVec 32) ValueCell!10512)) (size!29364 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60043)

(declare-fun mapDefault!34990 () ValueCell!10512)

(assert (=> b!969310 (= condMapEmpty!34990 (= (arr!28885 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10512)) mapDefault!34990)))))

(declare-fun mapNonEmpty!34990 () Bool)

(declare-fun tp!66558 () Bool)

(declare-fun e!546468 () Bool)

(assert (=> mapNonEmpty!34990 (= mapRes!34990 (and tp!66558 e!546468))))

(declare-fun mapValue!34990 () ValueCell!10512)

(declare-fun mapRest!34990 () (Array (_ BitVec 32) ValueCell!10512))

(declare-fun mapKey!34990 () (_ BitVec 32))

(assert (=> mapNonEmpty!34990 (= (arr!28885 _values!1425) (store mapRest!34990 mapKey!34990 mapValue!34990))))

(declare-fun res!648776 () Bool)

(assert (=> start!83096 (=> (not res!648776) (not e!546466))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83096 (= res!648776 (validMask!0 mask!2147))))

(assert (=> start!83096 e!546466))

(assert (=> start!83096 true))

(declare-fun array_inv!22361 (array!60043) Bool)

(assert (=> start!83096 (and (array_inv!22361 _values!1425) e!546467)))

(declare-fun array_inv!22362 (array!60041) Bool)

(assert (=> start!83096 (array_inv!22362 _keys!1717)))

(declare-fun b!969311 () Bool)

(declare-fun res!648775 () Bool)

(assert (=> b!969311 (=> (not res!648775) (not e!546466))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969311 (= res!648775 (and (= (size!29364 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29363 _keys!1717) (size!29364 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969312 () Bool)

(declare-fun res!648777 () Bool)

(assert (=> b!969312 (=> (not res!648777) (not e!546466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60041 (_ BitVec 32)) Bool)

(assert (=> b!969312 (= res!648777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969313 () Bool)

(assert (=> b!969313 (= e!546468 tp_is_empty!21987)))

(assert (= (and start!83096 res!648776) b!969311))

(assert (= (and b!969311 res!648775) b!969312))

(assert (= (and b!969312 res!648777) b!969309))

(assert (= (and b!969310 condMapEmpty!34990) mapIsEmpty!34990))

(assert (= (and b!969310 (not condMapEmpty!34990)) mapNonEmpty!34990))

(get-info :version)

(assert (= (and mapNonEmpty!34990 ((_ is ValueCellFull!10512) mapValue!34990)) b!969313))

(assert (= (and b!969310 ((_ is ValueCellFull!10512) mapDefault!34990)) b!969308))

(assert (= start!83096 b!969310))

(declare-fun m!897355 () Bool)

(assert (=> b!969309 m!897355))

(declare-fun m!897357 () Bool)

(assert (=> mapNonEmpty!34990 m!897357))

(declare-fun m!897359 () Bool)

(assert (=> start!83096 m!897359))

(declare-fun m!897361 () Bool)

(assert (=> start!83096 m!897361))

(declare-fun m!897363 () Bool)

(assert (=> start!83096 m!897363))

(declare-fun m!897365 () Bool)

(assert (=> b!969312 m!897365))

(check-sat (not b!969312) tp_is_empty!21987 (not b!969309) (not mapNonEmpty!34990) (not start!83096))
(check-sat)
