; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33458 () Bool)

(assert start!33458)

(declare-fun b!332109 () Bool)

(declare-fun e!203871 () Bool)

(assert (=> b!332109 (= e!203871 false)))

(declare-fun lt!158962 () Bool)

(declare-datatypes ((array!17019 0))(
  ( (array!17020 (arr!8044 (Array (_ BitVec 32) (_ BitVec 64))) (size!8396 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17019)

(declare-datatypes ((List!4581 0))(
  ( (Nil!4578) (Cons!4577 (h!5433 (_ BitVec 64)) (t!9663 List!4581)) )
))
(declare-fun arrayNoDuplicates!0 (array!17019 (_ BitVec 32) List!4581) Bool)

(assert (=> b!332109 (= lt!158962 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4578))))

(declare-fun mapNonEmpty!11451 () Bool)

(declare-fun mapRes!11451 () Bool)

(declare-fun tp!23826 () Bool)

(declare-fun e!203867 () Bool)

(assert (=> mapNonEmpty!11451 (= mapRes!11451 (and tp!23826 e!203867))))

(declare-datatypes ((V!9925 0))(
  ( (V!9926 (val!3400 Int)) )
))
(declare-datatypes ((ValueCell!3012 0))(
  ( (ValueCellFull!3012 (v!5559 V!9925)) (EmptyCell!3012) )
))
(declare-fun mapValue!11451 () ValueCell!3012)

(declare-datatypes ((array!17021 0))(
  ( (array!17022 (arr!8045 (Array (_ BitVec 32) ValueCell!3012)) (size!8397 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17021)

(declare-fun mapRest!11451 () (Array (_ BitVec 32) ValueCell!3012))

(declare-fun mapKey!11451 () (_ BitVec 32))

(assert (=> mapNonEmpty!11451 (= (arr!8045 _values!1525) (store mapRest!11451 mapKey!11451 mapValue!11451))))

(declare-fun b!332110 () Bool)

(declare-fun res!182967 () Bool)

(assert (=> b!332110 (=> (not res!182967) (not e!203871))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332110 (= res!182967 (and (= (size!8397 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8396 _keys!1895) (size!8397 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332111 () Bool)

(declare-fun e!203870 () Bool)

(declare-fun e!203868 () Bool)

(assert (=> b!332111 (= e!203870 (and e!203868 mapRes!11451))))

(declare-fun condMapEmpty!11451 () Bool)

(declare-fun mapDefault!11451 () ValueCell!3012)

(assert (=> b!332111 (= condMapEmpty!11451 (= (arr!8045 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3012)) mapDefault!11451)))))

(declare-fun b!332112 () Bool)

(declare-fun tp_is_empty!6711 () Bool)

(assert (=> b!332112 (= e!203867 tp_is_empty!6711)))

(declare-fun mapIsEmpty!11451 () Bool)

(assert (=> mapIsEmpty!11451 mapRes!11451))

(declare-fun res!182968 () Bool)

(assert (=> start!33458 (=> (not res!182968) (not e!203871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33458 (= res!182968 (validMask!0 mask!2385))))

(assert (=> start!33458 e!203871))

(assert (=> start!33458 true))

(declare-fun array_inv!5990 (array!17021) Bool)

(assert (=> start!33458 (and (array_inv!5990 _values!1525) e!203870)))

(declare-fun array_inv!5991 (array!17019) Bool)

(assert (=> start!33458 (array_inv!5991 _keys!1895)))

(declare-fun b!332113 () Bool)

(declare-fun res!182969 () Bool)

(assert (=> b!332113 (=> (not res!182969) (not e!203871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17019 (_ BitVec 32)) Bool)

(assert (=> b!332113 (= res!182969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332114 () Bool)

(assert (=> b!332114 (= e!203868 tp_is_empty!6711)))

(assert (= (and start!33458 res!182968) b!332110))

(assert (= (and b!332110 res!182967) b!332113))

(assert (= (and b!332113 res!182969) b!332109))

(assert (= (and b!332111 condMapEmpty!11451) mapIsEmpty!11451))

(assert (= (and b!332111 (not condMapEmpty!11451)) mapNonEmpty!11451))

(get-info :version)

(assert (= (and mapNonEmpty!11451 ((_ is ValueCellFull!3012) mapValue!11451)) b!332112))

(assert (= (and b!332111 ((_ is ValueCellFull!3012) mapDefault!11451)) b!332114))

(assert (= start!33458 b!332111))

(declare-fun m!336741 () Bool)

(assert (=> b!332109 m!336741))

(declare-fun m!336743 () Bool)

(assert (=> mapNonEmpty!11451 m!336743))

(declare-fun m!336745 () Bool)

(assert (=> start!33458 m!336745))

(declare-fun m!336747 () Bool)

(assert (=> start!33458 m!336747))

(declare-fun m!336749 () Bool)

(assert (=> start!33458 m!336749))

(declare-fun m!336751 () Bool)

(assert (=> b!332113 m!336751))

(check-sat (not b!332109) tp_is_empty!6711 (not start!33458) (not mapNonEmpty!11451) (not b!332113))
(check-sat)
