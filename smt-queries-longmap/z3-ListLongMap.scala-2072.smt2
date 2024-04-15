; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35586 () Bool)

(assert start!35586)

(declare-fun b!356812 () Bool)

(declare-fun e!218517 () Bool)

(declare-fun e!218520 () Bool)

(declare-fun mapRes!13587 () Bool)

(assert (=> b!356812 (= e!218517 (and e!218520 mapRes!13587))))

(declare-fun condMapEmpty!13587 () Bool)

(declare-datatypes ((V!11715 0))(
  ( (V!11716 (val!4071 Int)) )
))
(declare-datatypes ((ValueCell!3683 0))(
  ( (ValueCellFull!3683 (v!6259 V!11715)) (EmptyCell!3683) )
))
(declare-datatypes ((array!19661 0))(
  ( (array!19662 (arr!9324 (Array (_ BitVec 32) ValueCell!3683)) (size!9677 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19661)

(declare-fun mapDefault!13587 () ValueCell!3683)

(assert (=> b!356812 (= condMapEmpty!13587 (= (arr!9324 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3683)) mapDefault!13587)))))

(declare-fun b!356813 () Bool)

(declare-fun res!198126 () Bool)

(declare-fun e!218518 () Bool)

(assert (=> b!356813 (=> (not res!198126) (not e!218518))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19663 0))(
  ( (array!19664 (arr!9325 (Array (_ BitVec 32) (_ BitVec 64))) (size!9678 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19663)

(assert (=> b!356813 (= res!198126 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9678 _keys!1456))))))

(declare-fun b!356814 () Bool)

(declare-fun e!218519 () Bool)

(declare-fun tp_is_empty!8053 () Bool)

(assert (=> b!356814 (= e!218519 tp_is_empty!8053)))

(declare-fun mapIsEmpty!13587 () Bool)

(assert (=> mapIsEmpty!13587 mapRes!13587))

(declare-fun b!356815 () Bool)

(declare-fun res!198125 () Bool)

(assert (=> b!356815 (=> (not res!198125) (not e!218518))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356815 (= res!198125 (validKeyInArray!0 k0!1077))))

(declare-fun b!356816 () Bool)

(declare-fun res!198124 () Bool)

(assert (=> b!356816 (=> (not res!198124) (not e!218518))))

(declare-datatypes ((List!5348 0))(
  ( (Nil!5345) (Cons!5344 (h!6200 (_ BitVec 64)) (t!10489 List!5348)) )
))
(declare-fun arrayNoDuplicates!0 (array!19663 (_ BitVec 32) List!5348) Bool)

(assert (=> b!356816 (= res!198124 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5345))))

(declare-fun b!356817 () Bool)

(declare-fun res!198130 () Bool)

(assert (=> b!356817 (=> (not res!198130) (not e!218518))))

(assert (=> b!356817 (= res!198130 (not (= (select (arr!9325 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!198123 () Bool)

(assert (=> start!35586 (=> (not res!198123) (not e!218518))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35586 (= res!198123 (validMask!0 mask!1842))))

(assert (=> start!35586 e!218518))

(assert (=> start!35586 tp_is_empty!8053))

(assert (=> start!35586 true))

(declare-fun array_inv!6886 (array!19663) Bool)

(assert (=> start!35586 (array_inv!6886 _keys!1456)))

(declare-fun array_inv!6887 (array!19661) Bool)

(assert (=> start!35586 (and (array_inv!6887 _values!1208) e!218517)))

(declare-fun b!356818 () Bool)

(assert (=> b!356818 (= e!218520 tp_is_empty!8053)))

(declare-fun b!356819 () Bool)

(assert (=> b!356819 (= e!218518 (not true))))

(declare-fun arrayContainsKey!0 (array!19663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356819 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!10984 0))(
  ( (Unit!10985) )
))
(declare-fun lt!165760 () Unit!10984)

(declare-fun minValue!1150 () V!11715)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11715)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 (array!19663 array!19661 (_ BitVec 32) (_ BitVec 32) V!11715 V!11715 (_ BitVec 64) (_ BitVec 32)) Unit!10984)

(assert (=> b!356819 (= lt!165760 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!19 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13587 () Bool)

(declare-fun tp!27564 () Bool)

(assert (=> mapNonEmpty!13587 (= mapRes!13587 (and tp!27564 e!218519))))

(declare-fun mapRest!13587 () (Array (_ BitVec 32) ValueCell!3683))

(declare-fun mapValue!13587 () ValueCell!3683)

(declare-fun mapKey!13587 () (_ BitVec 32))

(assert (=> mapNonEmpty!13587 (= (arr!9324 _values!1208) (store mapRest!13587 mapKey!13587 mapValue!13587))))

(declare-fun b!356820 () Bool)

(declare-fun res!198129 () Bool)

(assert (=> b!356820 (=> (not res!198129) (not e!218518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19663 (_ BitVec 32)) Bool)

(assert (=> b!356820 (= res!198129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356821 () Bool)

(declare-fun res!198128 () Bool)

(assert (=> b!356821 (=> (not res!198128) (not e!218518))))

(assert (=> b!356821 (= res!198128 (and (= (size!9677 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9678 _keys!1456) (size!9677 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356822 () Bool)

(declare-fun res!198127 () Bool)

(assert (=> b!356822 (=> (not res!198127) (not e!218518))))

(assert (=> b!356822 (= res!198127 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35586 res!198123) b!356821))

(assert (= (and b!356821 res!198128) b!356820))

(assert (= (and b!356820 res!198129) b!356816))

(assert (= (and b!356816 res!198124) b!356815))

(assert (= (and b!356815 res!198125) b!356813))

(assert (= (and b!356813 res!198126) b!356822))

(assert (= (and b!356822 res!198127) b!356817))

(assert (= (and b!356817 res!198130) b!356819))

(assert (= (and b!356812 condMapEmpty!13587) mapIsEmpty!13587))

(assert (= (and b!356812 (not condMapEmpty!13587)) mapNonEmpty!13587))

(get-info :version)

(assert (= (and mapNonEmpty!13587 ((_ is ValueCellFull!3683) mapValue!13587)) b!356814))

(assert (= (and b!356812 ((_ is ValueCellFull!3683) mapDefault!13587)) b!356818))

(assert (= start!35586 b!356812))

(declare-fun m!354537 () Bool)

(assert (=> mapNonEmpty!13587 m!354537))

(declare-fun m!354539 () Bool)

(assert (=> b!356819 m!354539))

(declare-fun m!354541 () Bool)

(assert (=> b!356819 m!354541))

(declare-fun m!354543 () Bool)

(assert (=> b!356815 m!354543))

(declare-fun m!354545 () Bool)

(assert (=> start!35586 m!354545))

(declare-fun m!354547 () Bool)

(assert (=> start!35586 m!354547))

(declare-fun m!354549 () Bool)

(assert (=> start!35586 m!354549))

(declare-fun m!354551 () Bool)

(assert (=> b!356816 m!354551))

(declare-fun m!354553 () Bool)

(assert (=> b!356817 m!354553))

(declare-fun m!354555 () Bool)

(assert (=> b!356820 m!354555))

(declare-fun m!354557 () Bool)

(assert (=> b!356822 m!354557))

(check-sat (not b!356816) (not b!356819) (not b!356820) (not mapNonEmpty!13587) (not start!35586) tp_is_empty!8053 (not b!356815) (not b!356822))
(check-sat)
