; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33816 () Bool)

(assert start!33816)

(declare-fun b_free!7009 () Bool)

(declare-fun b_next!7009 () Bool)

(assert (=> start!33816 (= b_free!7009 (not b_next!7009))))

(declare-fun tp!24540 () Bool)

(declare-fun b_and!14169 () Bool)

(assert (=> start!33816 (= tp!24540 b_and!14169)))

(declare-fun mapIsEmpty!11847 () Bool)

(declare-fun mapRes!11847 () Bool)

(assert (=> mapIsEmpty!11847 mapRes!11847))

(declare-fun mapNonEmpty!11847 () Bool)

(declare-fun tp!24539 () Bool)

(declare-fun e!206364 () Bool)

(assert (=> mapNonEmpty!11847 (= mapRes!11847 (and tp!24539 e!206364))))

(declare-datatypes ((V!10259 0))(
  ( (V!10260 (val!3525 Int)) )
))
(declare-datatypes ((ValueCell!3137 0))(
  ( (ValueCellFull!3137 (v!5684 V!10259)) (EmptyCell!3137) )
))
(declare-fun mapValue!11847 () ValueCell!3137)

(declare-fun mapRest!11847 () (Array (_ BitVec 32) ValueCell!3137))

(declare-fun mapKey!11847 () (_ BitVec 32))

(declare-datatypes ((array!17501 0))(
  ( (array!17502 (arr!8278 (Array (_ BitVec 32) ValueCell!3137)) (size!8631 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17501)

(assert (=> mapNonEmpty!11847 (= (arr!8278 _values!1525) (store mapRest!11847 mapKey!11847 mapValue!11847))))

(declare-fun b!336207 () Bool)

(declare-fun res!185576 () Bool)

(declare-fun e!206368 () Bool)

(assert (=> b!336207 (=> (not res!185576) (not e!206368))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10259)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10259)

(declare-datatypes ((array!17503 0))(
  ( (array!17504 (arr!8279 (Array (_ BitVec 32) (_ BitVec 64))) (size!8632 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17503)

(declare-datatypes ((tuple2!5070 0))(
  ( (tuple2!5071 (_1!2546 (_ BitVec 64)) (_2!2546 V!10259)) )
))
(declare-datatypes ((List!4703 0))(
  ( (Nil!4700) (Cons!4699 (h!5555 tuple2!5070) (t!9788 List!4703)) )
))
(declare-datatypes ((ListLongMap!3973 0))(
  ( (ListLongMap!3974 (toList!2002 List!4703)) )
))
(declare-fun contains!2060 (ListLongMap!3973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1508 (array!17503 array!17501 (_ BitVec 32) (_ BitVec 32) V!10259 V!10259 (_ BitVec 32) Int) ListLongMap!3973)

(assert (=> b!336207 (= res!185576 (not (contains!2060 (getCurrentListMap!1508 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!185574 () Bool)

(assert (=> start!33816 (=> (not res!185574) (not e!206368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33816 (= res!185574 (validMask!0 mask!2385))))

(assert (=> start!33816 e!206368))

(assert (=> start!33816 true))

(declare-fun tp_is_empty!6961 () Bool)

(assert (=> start!33816 tp_is_empty!6961))

(assert (=> start!33816 tp!24540))

(declare-fun e!206367 () Bool)

(declare-fun array_inv!6180 (array!17501) Bool)

(assert (=> start!33816 (and (array_inv!6180 _values!1525) e!206367)))

(declare-fun array_inv!6181 (array!17503) Bool)

(assert (=> start!33816 (array_inv!6181 _keys!1895)))

(declare-fun b!336208 () Bool)

(declare-fun e!206366 () Bool)

(assert (=> b!336208 (= e!206367 (and e!206366 mapRes!11847))))

(declare-fun condMapEmpty!11847 () Bool)

(declare-fun mapDefault!11847 () ValueCell!3137)

(assert (=> b!336208 (= condMapEmpty!11847 (= (arr!8278 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3137)) mapDefault!11847)))))

(declare-fun b!336209 () Bool)

(declare-fun res!185579 () Bool)

(assert (=> b!336209 (=> (not res!185579) (not e!206368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17503 (_ BitVec 32)) Bool)

(assert (=> b!336209 (= res!185579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336210 () Bool)

(declare-fun res!185578 () Bool)

(assert (=> b!336210 (=> (not res!185578) (not e!206368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336210 (= res!185578 (validKeyInArray!0 k0!1348))))

(declare-fun b!336211 () Bool)

(assert (=> b!336211 (= e!206368 false)))

(declare-datatypes ((SeekEntryResult!3202 0))(
  ( (MissingZero!3202 (index!14987 (_ BitVec 32))) (Found!3202 (index!14988 (_ BitVec 32))) (Intermediate!3202 (undefined!4014 Bool) (index!14989 (_ BitVec 32)) (x!33529 (_ BitVec 32))) (Undefined!3202) (MissingVacant!3202 (index!14990 (_ BitVec 32))) )
))
(declare-fun lt!160029 () SeekEntryResult!3202)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17503 (_ BitVec 32)) SeekEntryResult!3202)

(assert (=> b!336211 (= lt!160029 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336212 () Bool)

(declare-fun res!185575 () Bool)

(assert (=> b!336212 (=> (not res!185575) (not e!206368))))

(declare-datatypes ((List!4704 0))(
  ( (Nil!4701) (Cons!4700 (h!5556 (_ BitVec 64)) (t!9789 List!4704)) )
))
(declare-fun arrayNoDuplicates!0 (array!17503 (_ BitVec 32) List!4704) Bool)

(assert (=> b!336212 (= res!185575 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4701))))

(declare-fun b!336213 () Bool)

(assert (=> b!336213 (= e!206364 tp_is_empty!6961)))

(declare-fun b!336214 () Bool)

(assert (=> b!336214 (= e!206366 tp_is_empty!6961)))

(declare-fun b!336215 () Bool)

(declare-fun res!185577 () Bool)

(assert (=> b!336215 (=> (not res!185577) (not e!206368))))

(assert (=> b!336215 (= res!185577 (and (= (size!8631 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8632 _keys!1895) (size!8631 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33816 res!185574) b!336215))

(assert (= (and b!336215 res!185577) b!336209))

(assert (= (and b!336209 res!185579) b!336212))

(assert (= (and b!336212 res!185575) b!336210))

(assert (= (and b!336210 res!185578) b!336207))

(assert (= (and b!336207 res!185576) b!336211))

(assert (= (and b!336208 condMapEmpty!11847) mapIsEmpty!11847))

(assert (= (and b!336208 (not condMapEmpty!11847)) mapNonEmpty!11847))

(get-info :version)

(assert (= (and mapNonEmpty!11847 ((_ is ValueCellFull!3137) mapValue!11847)) b!336213))

(assert (= (and b!336208 ((_ is ValueCellFull!3137) mapDefault!11847)) b!336214))

(assert (= start!33816 b!336208))

(declare-fun m!339541 () Bool)

(assert (=> start!33816 m!339541))

(declare-fun m!339543 () Bool)

(assert (=> start!33816 m!339543))

(declare-fun m!339545 () Bool)

(assert (=> start!33816 m!339545))

(declare-fun m!339547 () Bool)

(assert (=> b!336207 m!339547))

(assert (=> b!336207 m!339547))

(declare-fun m!339549 () Bool)

(assert (=> b!336207 m!339549))

(declare-fun m!339551 () Bool)

(assert (=> mapNonEmpty!11847 m!339551))

(declare-fun m!339553 () Bool)

(assert (=> b!336210 m!339553))

(declare-fun m!339555 () Bool)

(assert (=> b!336212 m!339555))

(declare-fun m!339557 () Bool)

(assert (=> b!336211 m!339557))

(declare-fun m!339559 () Bool)

(assert (=> b!336209 m!339559))

(check-sat (not b!336211) (not b!336209) b_and!14169 (not b!336212) (not b!336207) tp_is_empty!6961 (not b!336210) (not b_next!7009) (not start!33816) (not mapNonEmpty!11847))
(check-sat b_and!14169 (not b_next!7009))
