; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20044 () Bool)

(assert start!20044)

(declare-fun b!196104 () Bool)

(declare-fun res!92527 () Bool)

(declare-fun e!129122 () Bool)

(assert (=> b!196104 (=> (not res!92527) (not e!129122))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5721 0))(
  ( (V!5722 (val!2322 Int)) )
))
(declare-datatypes ((ValueCell!1934 0))(
  ( (ValueCellFull!1934 (v!4286 V!5721)) (EmptyCell!1934) )
))
(declare-datatypes ((array!8349 0))(
  ( (array!8350 (arr!3924 (Array (_ BitVec 32) ValueCell!1934)) (size!4250 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8349)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!8351 0))(
  ( (array!8352 (arr!3925 (Array (_ BitVec 32) (_ BitVec 64))) (size!4251 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8351)

(assert (=> b!196104 (= res!92527 (and (= (size!4250 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4251 _keys!825) (size!4250 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7901 () Bool)

(declare-fun mapRes!7901 () Bool)

(assert (=> mapIsEmpty!7901 mapRes!7901))

(declare-fun b!196105 () Bool)

(declare-fun e!129123 () Bool)

(declare-fun tp_is_empty!4555 () Bool)

(assert (=> b!196105 (= e!129123 tp_is_empty!4555)))

(declare-fun b!196106 () Bool)

(assert (=> b!196106 (= e!129122 false)))

(declare-fun lt!97406 () Bool)

(declare-datatypes ((List!2443 0))(
  ( (Nil!2440) (Cons!2439 (h!3081 (_ BitVec 64)) (t!7365 List!2443)) )
))
(declare-fun arrayNoDuplicates!0 (array!8351 (_ BitVec 32) List!2443) Bool)

(assert (=> b!196106 (= lt!97406 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2440))))

(declare-fun b!196107 () Bool)

(declare-fun e!129119 () Bool)

(declare-fun e!129120 () Bool)

(assert (=> b!196107 (= e!129119 (and e!129120 mapRes!7901))))

(declare-fun condMapEmpty!7901 () Bool)

(declare-fun mapDefault!7901 () ValueCell!1934)

(assert (=> b!196107 (= condMapEmpty!7901 (= (arr!3924 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1934)) mapDefault!7901)))))

(declare-fun b!196109 () Bool)

(assert (=> b!196109 (= e!129120 tp_is_empty!4555)))

(declare-fun mapNonEmpty!7901 () Bool)

(declare-fun tp!17189 () Bool)

(assert (=> mapNonEmpty!7901 (= mapRes!7901 (and tp!17189 e!129123))))

(declare-fun mapRest!7901 () (Array (_ BitVec 32) ValueCell!1934))

(declare-fun mapKey!7901 () (_ BitVec 32))

(declare-fun mapValue!7901 () ValueCell!1934)

(assert (=> mapNonEmpty!7901 (= (arr!3924 _values!649) (store mapRest!7901 mapKey!7901 mapValue!7901))))

(declare-fun res!92528 () Bool)

(assert (=> start!20044 (=> (not res!92528) (not e!129122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20044 (= res!92528 (validMask!0 mask!1149))))

(assert (=> start!20044 e!129122))

(assert (=> start!20044 true))

(declare-fun array_inv!2543 (array!8349) Bool)

(assert (=> start!20044 (and (array_inv!2543 _values!649) e!129119)))

(declare-fun array_inv!2544 (array!8351) Bool)

(assert (=> start!20044 (array_inv!2544 _keys!825)))

(declare-fun b!196108 () Bool)

(declare-fun res!92526 () Bool)

(assert (=> b!196108 (=> (not res!92526) (not e!129122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8351 (_ BitVec 32)) Bool)

(assert (=> b!196108 (= res!92526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20044 res!92528) b!196104))

(assert (= (and b!196104 res!92527) b!196108))

(assert (= (and b!196108 res!92526) b!196106))

(assert (= (and b!196107 condMapEmpty!7901) mapIsEmpty!7901))

(assert (= (and b!196107 (not condMapEmpty!7901)) mapNonEmpty!7901))

(get-info :version)

(assert (= (and mapNonEmpty!7901 ((_ is ValueCellFull!1934) mapValue!7901)) b!196105))

(assert (= (and b!196107 ((_ is ValueCellFull!1934) mapDefault!7901)) b!196109))

(assert (= start!20044 b!196107))

(declare-fun m!222975 () Bool)

(assert (=> b!196106 m!222975))

(declare-fun m!222977 () Bool)

(assert (=> mapNonEmpty!7901 m!222977))

(declare-fun m!222979 () Bool)

(assert (=> start!20044 m!222979))

(declare-fun m!222981 () Bool)

(assert (=> start!20044 m!222981))

(declare-fun m!222983 () Bool)

(assert (=> start!20044 m!222983))

(declare-fun m!222985 () Bool)

(assert (=> b!196108 m!222985))

(check-sat (not mapNonEmpty!7901) (not b!196108) tp_is_empty!4555 (not b!196106) (not start!20044))
(check-sat)
