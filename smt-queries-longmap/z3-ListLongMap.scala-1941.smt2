; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34342 () Bool)

(assert start!34342)

(declare-fun b_free!7317 () Bool)

(declare-fun b_next!7317 () Bool)

(assert (=> start!34342 (= b_free!7317 (not b_next!7317))))

(declare-fun tp!25491 () Bool)

(declare-fun b_and!14521 () Bool)

(assert (=> start!34342 (= tp!25491 b_and!14521)))

(declare-fun b!342947 () Bool)

(declare-fun e!210294 () Bool)

(declare-fun e!210292 () Bool)

(assert (=> b!342947 (= e!210294 e!210292)))

(declare-fun res!189589 () Bool)

(assert (=> b!342947 (=> (not res!189589) (not e!210292))))

(declare-datatypes ((SeekEntryResult!3311 0))(
  ( (MissingZero!3311 (index!15423 (_ BitVec 32))) (Found!3311 (index!15424 (_ BitVec 32))) (Intermediate!3311 (undefined!4123 Bool) (index!15425 (_ BitVec 32)) (x!34141 (_ BitVec 32))) (Undefined!3311) (MissingVacant!3311 (index!15426 (_ BitVec 32))) )
))
(declare-fun lt!162284 () SeekEntryResult!3311)

(get-info :version)

(assert (=> b!342947 (= res!189589 (and (not ((_ is Found!3311) lt!162284)) (not ((_ is MissingZero!3311) lt!162284)) ((_ is MissingVacant!3311) lt!162284)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18129 0))(
  ( (array!18130 (arr!8583 (Array (_ BitVec 32) (_ BitVec 64))) (size!8935 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18129)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18129 (_ BitVec 32)) SeekEntryResult!3311)

(assert (=> b!342947 (= lt!162284 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342948 () Bool)

(declare-fun res!189587 () Bool)

(assert (=> b!342948 (=> (not res!189587) (not e!210294))))

(declare-datatypes ((List!4949 0))(
  ( (Nil!4946) (Cons!4945 (h!5801 (_ BitVec 64)) (t!10061 List!4949)) )
))
(declare-fun arrayNoDuplicates!0 (array!18129 (_ BitVec 32) List!4949) Bool)

(assert (=> b!342948 (= res!189587 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4946))))

(declare-fun b!342949 () Bool)

(declare-fun res!189588 () Bool)

(assert (=> b!342949 (=> (not res!189588) (not e!210294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18129 (_ BitVec 32)) Bool)

(assert (=> b!342949 (= res!189588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342950 () Bool)

(declare-fun e!210290 () Bool)

(declare-fun tp_is_empty!7269 () Bool)

(assert (=> b!342950 (= e!210290 tp_is_empty!7269)))

(declare-fun b!342951 () Bool)

(declare-fun e!210289 () Bool)

(declare-fun e!210293 () Bool)

(declare-fun mapRes!12336 () Bool)

(assert (=> b!342951 (= e!210289 (and e!210293 mapRes!12336))))

(declare-fun condMapEmpty!12336 () Bool)

(declare-datatypes ((V!10669 0))(
  ( (V!10670 (val!3679 Int)) )
))
(declare-datatypes ((ValueCell!3291 0))(
  ( (ValueCellFull!3291 (v!5853 V!10669)) (EmptyCell!3291) )
))
(declare-datatypes ((array!18131 0))(
  ( (array!18132 (arr!8584 (Array (_ BitVec 32) ValueCell!3291)) (size!8936 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18131)

(declare-fun mapDefault!12336 () ValueCell!3291)

(assert (=> b!342951 (= condMapEmpty!12336 (= (arr!8584 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3291)) mapDefault!12336)))))

(declare-fun b!342952 () Bool)

(declare-datatypes ((Unit!10700 0))(
  ( (Unit!10701) )
))
(declare-fun e!210288 () Unit!10700)

(declare-fun Unit!10702 () Unit!10700)

(assert (=> b!342952 (= e!210288 Unit!10702)))

(declare-fun zeroValue!1467 () V!10669)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!162286 () Unit!10700)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10669)

(declare-fun lemmaArrayContainsKeyThenInListMap!309 (array!18129 array!18131 (_ BitVec 32) (_ BitVec 32) V!10669 V!10669 (_ BitVec 64) (_ BitVec 32) Int) Unit!10700)

(declare-fun arrayScanForKey!0 (array!18129 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342952 (= lt!162286 (lemmaArrayContainsKeyThenInListMap!309 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342952 false))

(declare-fun b!342953 () Bool)

(declare-fun res!189586 () Bool)

(assert (=> b!342953 (=> (not res!189586) (not e!210294))))

(assert (=> b!342953 (= res!189586 (and (= (size!8936 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8935 _keys!1895) (size!8936 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342954 () Bool)

(declare-fun Unit!10703 () Unit!10700)

(assert (=> b!342954 (= e!210288 Unit!10703)))

(declare-fun b!342955 () Bool)

(declare-fun res!189590 () Bool)

(assert (=> b!342955 (=> (not res!189590) (not e!210294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342955 (= res!189590 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12336 () Bool)

(declare-fun tp!25490 () Bool)

(assert (=> mapNonEmpty!12336 (= mapRes!12336 (and tp!25490 e!210290))))

(declare-fun mapValue!12336 () ValueCell!3291)

(declare-fun mapRest!12336 () (Array (_ BitVec 32) ValueCell!3291))

(declare-fun mapKey!12336 () (_ BitVec 32))

(assert (=> mapNonEmpty!12336 (= (arr!8584 _values!1525) (store mapRest!12336 mapKey!12336 mapValue!12336))))

(declare-fun mapIsEmpty!12336 () Bool)

(assert (=> mapIsEmpty!12336 mapRes!12336))

(declare-fun b!342957 () Bool)

(declare-fun res!189585 () Bool)

(assert (=> b!342957 (=> (not res!189585) (not e!210294))))

(declare-datatypes ((tuple2!5330 0))(
  ( (tuple2!5331 (_1!2676 (_ BitVec 64)) (_2!2676 V!10669)) )
))
(declare-datatypes ((List!4950 0))(
  ( (Nil!4947) (Cons!4946 (h!5802 tuple2!5330) (t!10062 List!4950)) )
))
(declare-datatypes ((ListLongMap!4243 0))(
  ( (ListLongMap!4244 (toList!2137 List!4950)) )
))
(declare-fun contains!2193 (ListLongMap!4243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1658 (array!18129 array!18131 (_ BitVec 32) (_ BitVec 32) V!10669 V!10669 (_ BitVec 32) Int) ListLongMap!4243)

(assert (=> b!342957 (= res!189585 (not (contains!2193 (getCurrentListMap!1658 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342958 () Bool)

(assert (=> b!342958 (= e!210293 tp_is_empty!7269)))

(declare-fun b!342956 () Bool)

(assert (=> b!342956 (= e!210292 false)))

(declare-fun lt!162285 () Unit!10700)

(assert (=> b!342956 (= lt!162285 e!210288)))

(declare-fun c!52857 () Bool)

(declare-fun arrayContainsKey!0 (array!18129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342956 (= c!52857 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!189584 () Bool)

(assert (=> start!34342 (=> (not res!189584) (not e!210294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34342 (= res!189584 (validMask!0 mask!2385))))

(assert (=> start!34342 e!210294))

(assert (=> start!34342 true))

(assert (=> start!34342 tp_is_empty!7269))

(assert (=> start!34342 tp!25491))

(declare-fun array_inv!6356 (array!18131) Bool)

(assert (=> start!34342 (and (array_inv!6356 _values!1525) e!210289)))

(declare-fun array_inv!6357 (array!18129) Bool)

(assert (=> start!34342 (array_inv!6357 _keys!1895)))

(assert (= (and start!34342 res!189584) b!342953))

(assert (= (and b!342953 res!189586) b!342949))

(assert (= (and b!342949 res!189588) b!342948))

(assert (= (and b!342948 res!189587) b!342955))

(assert (= (and b!342955 res!189590) b!342957))

(assert (= (and b!342957 res!189585) b!342947))

(assert (= (and b!342947 res!189589) b!342956))

(assert (= (and b!342956 c!52857) b!342952))

(assert (= (and b!342956 (not c!52857)) b!342954))

(assert (= (and b!342951 condMapEmpty!12336) mapIsEmpty!12336))

(assert (= (and b!342951 (not condMapEmpty!12336)) mapNonEmpty!12336))

(assert (= (and mapNonEmpty!12336 ((_ is ValueCellFull!3291) mapValue!12336)) b!342950))

(assert (= (and b!342951 ((_ is ValueCellFull!3291) mapDefault!12336)) b!342958))

(assert (= start!34342 b!342951))

(declare-fun m!344961 () Bool)

(assert (=> b!342947 m!344961))

(declare-fun m!344963 () Bool)

(assert (=> mapNonEmpty!12336 m!344963))

(declare-fun m!344965 () Bool)

(assert (=> b!342955 m!344965))

(declare-fun m!344967 () Bool)

(assert (=> b!342957 m!344967))

(assert (=> b!342957 m!344967))

(declare-fun m!344969 () Bool)

(assert (=> b!342957 m!344969))

(declare-fun m!344971 () Bool)

(assert (=> b!342952 m!344971))

(assert (=> b!342952 m!344971))

(declare-fun m!344973 () Bool)

(assert (=> b!342952 m!344973))

(declare-fun m!344975 () Bool)

(assert (=> b!342948 m!344975))

(declare-fun m!344977 () Bool)

(assert (=> b!342949 m!344977))

(declare-fun m!344979 () Bool)

(assert (=> start!34342 m!344979))

(declare-fun m!344981 () Bool)

(assert (=> start!34342 m!344981))

(declare-fun m!344983 () Bool)

(assert (=> start!34342 m!344983))

(declare-fun m!344985 () Bool)

(assert (=> b!342956 m!344985))

(check-sat (not b_next!7317) (not b!342952) (not b!342949) (not b!342956) (not start!34342) (not b!342948) (not b!342955) b_and!14521 (not mapNonEmpty!12336) (not b!342947) (not b!342957) tp_is_empty!7269)
(check-sat b_and!14521 (not b_next!7317))
