; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!612 () Bool)

(assert start!612)

(declare-fun b_free!85 () Bool)

(declare-fun b_next!85 () Bool)

(assert (=> start!612 (= b_free!85 (not b_next!85))))

(declare-fun tp!472 () Bool)

(declare-fun b_and!223 () Bool)

(assert (=> start!612 (= tp!472 b_and!223)))

(declare-fun b!3826 () Bool)

(declare-fun res!5391 () Bool)

(declare-fun e!1940 () Bool)

(assert (=> b!3826 (=> (not res!5391) (not e!1940))))

(declare-datatypes ((array!255 0))(
  ( (array!256 (arr!120 (Array (_ BitVec 32) (_ BitVec 64))) (size!182 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!255)

(declare-datatypes ((List!75 0))(
  ( (Nil!72) (Cons!71 (h!637 (_ BitVec 64)) (t!2202 List!75)) )
))
(declare-fun arrayNoDuplicates!0 (array!255 (_ BitVec 32) List!75) Bool)

(assert (=> b!3826 (= res!5391 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!72))))

(declare-fun mapNonEmpty!203 () Bool)

(declare-fun mapRes!203 () Bool)

(declare-fun tp!473 () Bool)

(declare-fun e!1939 () Bool)

(assert (=> mapNonEmpty!203 (= mapRes!203 (and tp!473 e!1939))))

(declare-datatypes ((V!395 0))(
  ( (V!396 (val!87 Int)) )
))
(declare-datatypes ((ValueCell!65 0))(
  ( (ValueCellFull!65 (v!1174 V!395)) (EmptyCell!65) )
))
(declare-fun mapValue!203 () ValueCell!65)

(declare-datatypes ((array!257 0))(
  ( (array!258 (arr!121 (Array (_ BitVec 32) ValueCell!65)) (size!183 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!257)

(declare-fun mapKey!203 () (_ BitVec 32))

(declare-fun mapRest!203 () (Array (_ BitVec 32) ValueCell!65))

(assert (=> mapNonEmpty!203 (= (arr!121 _values!1492) (store mapRest!203 mapKey!203 mapValue!203))))

(declare-fun b!3827 () Bool)

(declare-fun e!1938 () Bool)

(declare-fun e!1937 () Bool)

(assert (=> b!3827 (= e!1938 (and e!1937 mapRes!203))))

(declare-fun condMapEmpty!203 () Bool)

(declare-fun mapDefault!203 () ValueCell!65)

(assert (=> b!3827 (= condMapEmpty!203 (= (arr!121 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!65)) mapDefault!203)))))

(declare-fun b!3828 () Bool)

(declare-fun tp_is_empty!163 () Bool)

(assert (=> b!3828 (= e!1937 tp_is_empty!163)))

(declare-fun b!3829 () Bool)

(declare-fun res!5392 () Bool)

(assert (=> b!3829 (=> (not res!5392) (not e!1940))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3829 (= res!5392 (and (= (size!183 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!182 _keys!1806) (size!183 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3830 () Bool)

(assert (=> b!3830 (= e!1939 tp_is_empty!163)))

(declare-fun b!3831 () Bool)

(assert (=> b!3831 (= e!1940 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!395)

(declare-fun lt!528 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!395)

(declare-datatypes ((tuple2!68 0))(
  ( (tuple2!69 (_1!34 (_ BitVec 64)) (_2!34 V!395)) )
))
(declare-datatypes ((List!76 0))(
  ( (Nil!73) (Cons!72 (h!638 tuple2!68) (t!2203 List!76)) )
))
(declare-datatypes ((ListLongMap!73 0))(
  ( (ListLongMap!74 (toList!52 List!76)) )
))
(declare-fun contains!22 (ListLongMap!73 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!11 (array!255 array!257 (_ BitVec 32) (_ BitVec 32) V!395 V!395 (_ BitVec 32) Int) ListLongMap!73)

(assert (=> b!3831 (= lt!528 (contains!22 (getCurrentListMap!11 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!5390 () Bool)

(assert (=> start!612 (=> (not res!5390) (not e!1940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!612 (= res!5390 (validMask!0 mask!2250))))

(assert (=> start!612 e!1940))

(assert (=> start!612 tp!472))

(assert (=> start!612 true))

(declare-fun array_inv!83 (array!257) Bool)

(assert (=> start!612 (and (array_inv!83 _values!1492) e!1938)))

(assert (=> start!612 tp_is_empty!163))

(declare-fun array_inv!84 (array!255) Bool)

(assert (=> start!612 (array_inv!84 _keys!1806)))

(declare-fun b!3832 () Bool)

(declare-fun res!5389 () Bool)

(assert (=> b!3832 (=> (not res!5389) (not e!1940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!255 (_ BitVec 32)) Bool)

(assert (=> b!3832 (= res!5389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!203 () Bool)

(assert (=> mapIsEmpty!203 mapRes!203))

(assert (= (and start!612 res!5390) b!3829))

(assert (= (and b!3829 res!5392) b!3832))

(assert (= (and b!3832 res!5389) b!3826))

(assert (= (and b!3826 res!5391) b!3831))

(assert (= (and b!3827 condMapEmpty!203) mapIsEmpty!203))

(assert (= (and b!3827 (not condMapEmpty!203)) mapNonEmpty!203))

(get-info :version)

(assert (= (and mapNonEmpty!203 ((_ is ValueCellFull!65) mapValue!203)) b!3830))

(assert (= (and b!3827 ((_ is ValueCellFull!65) mapDefault!203)) b!3828))

(assert (= start!612 b!3827))

(declare-fun m!1919 () Bool)

(assert (=> start!612 m!1919))

(declare-fun m!1921 () Bool)

(assert (=> start!612 m!1921))

(declare-fun m!1923 () Bool)

(assert (=> start!612 m!1923))

(declare-fun m!1925 () Bool)

(assert (=> b!3832 m!1925))

(declare-fun m!1927 () Bool)

(assert (=> b!3826 m!1927))

(declare-fun m!1929 () Bool)

(assert (=> b!3831 m!1929))

(assert (=> b!3831 m!1929))

(declare-fun m!1931 () Bool)

(assert (=> b!3831 m!1931))

(declare-fun m!1933 () Bool)

(assert (=> mapNonEmpty!203 m!1933))

(check-sat (not mapNonEmpty!203) (not start!612) tp_is_empty!163 (not b!3832) (not b!3831) b_and!223 (not b_next!85) (not b!3826))
(check-sat b_and!223 (not b_next!85))
