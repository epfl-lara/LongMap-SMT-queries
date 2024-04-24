; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33816 () Bool)

(assert start!33816)

(declare-fun b_free!7009 () Bool)

(declare-fun b_next!7009 () Bool)

(assert (=> start!33816 (= b_free!7009 (not b_next!7009))))

(declare-fun tp!24540 () Bool)

(declare-fun b_and!14209 () Bool)

(assert (=> start!33816 (= tp!24540 b_and!14209)))

(declare-fun mapIsEmpty!11847 () Bool)

(declare-fun mapRes!11847 () Bool)

(assert (=> mapIsEmpty!11847 mapRes!11847))

(declare-fun b!336429 () Bool)

(declare-fun res!185701 () Bool)

(declare-fun e!206510 () Bool)

(assert (=> b!336429 (=> (not res!185701) (not e!206510))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336429 (= res!185701 (validKeyInArray!0 k0!1348))))

(declare-fun b!336430 () Bool)

(declare-fun res!185702 () Bool)

(assert (=> b!336430 (=> (not res!185702) (not e!206510))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10259 0))(
  ( (V!10260 (val!3525 Int)) )
))
(declare-fun zeroValue!1467 () V!10259)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3137 0))(
  ( (ValueCellFull!3137 (v!5691 V!10259)) (EmptyCell!3137) )
))
(declare-datatypes ((array!17506 0))(
  ( (array!17507 (arr!8280 (Array (_ BitVec 32) ValueCell!3137)) (size!8632 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17506)

(declare-datatypes ((array!17508 0))(
  ( (array!17509 (arr!8281 (Array (_ BitVec 32) (_ BitVec 64))) (size!8633 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17508)

(declare-fun minValue!1467 () V!10259)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5040 0))(
  ( (tuple2!5041 (_1!2531 (_ BitVec 64)) (_2!2531 V!10259)) )
))
(declare-datatypes ((List!4655 0))(
  ( (Nil!4652) (Cons!4651 (h!5507 tuple2!5040) (t!9741 List!4655)) )
))
(declare-datatypes ((ListLongMap!3955 0))(
  ( (ListLongMap!3956 (toList!1993 List!4655)) )
))
(declare-fun contains!2059 (ListLongMap!3955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1522 (array!17508 array!17506 (_ BitVec 32) (_ BitVec 32) V!10259 V!10259 (_ BitVec 32) Int) ListLongMap!3955)

(assert (=> b!336430 (= res!185702 (not (contains!2059 (getCurrentListMap!1522 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336431 () Bool)

(declare-fun e!206508 () Bool)

(declare-fun tp_is_empty!6961 () Bool)

(assert (=> b!336431 (= e!206508 tp_is_empty!6961)))

(declare-fun b!336432 () Bool)

(declare-fun e!206507 () Bool)

(declare-fun e!206506 () Bool)

(assert (=> b!336432 (= e!206507 (and e!206506 mapRes!11847))))

(declare-fun condMapEmpty!11847 () Bool)

(declare-fun mapDefault!11847 () ValueCell!3137)

(assert (=> b!336432 (= condMapEmpty!11847 (= (arr!8280 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3137)) mapDefault!11847)))))

(declare-fun b!336433 () Bool)

(declare-fun res!185703 () Bool)

(assert (=> b!336433 (=> (not res!185703) (not e!206510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17508 (_ BitVec 32)) Bool)

(assert (=> b!336433 (= res!185703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!185700 () Bool)

(assert (=> start!33816 (=> (not res!185700) (not e!206510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33816 (= res!185700 (validMask!0 mask!2385))))

(assert (=> start!33816 e!206510))

(assert (=> start!33816 true))

(assert (=> start!33816 tp_is_empty!6961))

(assert (=> start!33816 tp!24540))

(declare-fun array_inv!6156 (array!17506) Bool)

(assert (=> start!33816 (and (array_inv!6156 _values!1525) e!206507)))

(declare-fun array_inv!6157 (array!17508) Bool)

(assert (=> start!33816 (array_inv!6157 _keys!1895)))

(declare-fun mapNonEmpty!11847 () Bool)

(declare-fun tp!24539 () Bool)

(assert (=> mapNonEmpty!11847 (= mapRes!11847 (and tp!24539 e!206508))))

(declare-fun mapValue!11847 () ValueCell!3137)

(declare-fun mapRest!11847 () (Array (_ BitVec 32) ValueCell!3137))

(declare-fun mapKey!11847 () (_ BitVec 32))

(assert (=> mapNonEmpty!11847 (= (arr!8280 _values!1525) (store mapRest!11847 mapKey!11847 mapValue!11847))))

(declare-fun b!336434 () Bool)

(declare-fun res!185705 () Bool)

(assert (=> b!336434 (=> (not res!185705) (not e!206510))))

(assert (=> b!336434 (= res!185705 (and (= (size!8632 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8633 _keys!1895) (size!8632 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336435 () Bool)

(assert (=> b!336435 (= e!206506 tp_is_empty!6961)))

(declare-fun b!336436 () Bool)

(declare-fun res!185704 () Bool)

(assert (=> b!336436 (=> (not res!185704) (not e!206510))))

(declare-datatypes ((List!4656 0))(
  ( (Nil!4653) (Cons!4652 (h!5508 (_ BitVec 64)) (t!9742 List!4656)) )
))
(declare-fun arrayNoDuplicates!0 (array!17508 (_ BitVec 32) List!4656) Bool)

(assert (=> b!336436 (= res!185704 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4653))))

(declare-fun b!336437 () Bool)

(assert (=> b!336437 (= e!206510 false)))

(declare-datatypes ((SeekEntryResult!3166 0))(
  ( (MissingZero!3166 (index!14843 (_ BitVec 32))) (Found!3166 (index!14844 (_ BitVec 32))) (Intermediate!3166 (undefined!3978 Bool) (index!14845 (_ BitVec 32)) (x!33495 (_ BitVec 32))) (Undefined!3166) (MissingVacant!3166 (index!14846 (_ BitVec 32))) )
))
(declare-fun lt!160282 () SeekEntryResult!3166)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17508 (_ BitVec 32)) SeekEntryResult!3166)

(assert (=> b!336437 (= lt!160282 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33816 res!185700) b!336434))

(assert (= (and b!336434 res!185705) b!336433))

(assert (= (and b!336433 res!185703) b!336436))

(assert (= (and b!336436 res!185704) b!336429))

(assert (= (and b!336429 res!185701) b!336430))

(assert (= (and b!336430 res!185702) b!336437))

(assert (= (and b!336432 condMapEmpty!11847) mapIsEmpty!11847))

(assert (= (and b!336432 (not condMapEmpty!11847)) mapNonEmpty!11847))

(get-info :version)

(assert (= (and mapNonEmpty!11847 ((_ is ValueCellFull!3137) mapValue!11847)) b!336431))

(assert (= (and b!336432 ((_ is ValueCellFull!3137) mapDefault!11847)) b!336435))

(assert (= start!33816 b!336432))

(declare-fun m!340495 () Bool)

(assert (=> b!336429 m!340495))

(declare-fun m!340497 () Bool)

(assert (=> b!336436 m!340497))

(declare-fun m!340499 () Bool)

(assert (=> mapNonEmpty!11847 m!340499))

(declare-fun m!340501 () Bool)

(assert (=> b!336433 m!340501))

(declare-fun m!340503 () Bool)

(assert (=> start!33816 m!340503))

(declare-fun m!340505 () Bool)

(assert (=> start!33816 m!340505))

(declare-fun m!340507 () Bool)

(assert (=> start!33816 m!340507))

(declare-fun m!340509 () Bool)

(assert (=> b!336437 m!340509))

(declare-fun m!340511 () Bool)

(assert (=> b!336430 m!340511))

(assert (=> b!336430 m!340511))

(declare-fun m!340513 () Bool)

(assert (=> b!336430 m!340513))

(check-sat b_and!14209 (not b_next!7009) (not mapNonEmpty!11847) (not b!336430) (not start!33816) (not b!336436) tp_is_empty!6961 (not b!336429) (not b!336433) (not b!336437))
(check-sat b_and!14209 (not b_next!7009))
