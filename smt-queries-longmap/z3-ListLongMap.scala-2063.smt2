; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35532 () Bool)

(assert start!35532)

(declare-fun b!356143 () Bool)

(declare-fun res!197607 () Bool)

(declare-fun e!218257 () Bool)

(assert (=> b!356143 (=> (not res!197607) (not e!218257))))

(declare-datatypes ((array!19554 0))(
  ( (array!19555 (arr!9270 (Array (_ BitVec 32) (_ BitVec 64))) (size!9622 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19554)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!356143 (= res!197607 (not (= (select (arr!9270 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356145 () Bool)

(declare-fun e!218255 () Bool)

(declare-fun e!218254 () Bool)

(declare-fun mapRes!13506 () Bool)

(assert (=> b!356145 (= e!218255 (and e!218254 mapRes!13506))))

(declare-fun condMapEmpty!13506 () Bool)

(declare-datatypes ((V!11643 0))(
  ( (V!11644 (val!4044 Int)) )
))
(declare-datatypes ((ValueCell!3656 0))(
  ( (ValueCellFull!3656 (v!6239 V!11643)) (EmptyCell!3656) )
))
(declare-datatypes ((array!19556 0))(
  ( (array!19557 (arr!9271 (Array (_ BitVec 32) ValueCell!3656)) (size!9623 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19556)

(declare-fun mapDefault!13506 () ValueCell!3656)

(assert (=> b!356145 (= condMapEmpty!13506 (= (arr!9271 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3656)) mapDefault!13506)))))

(declare-fun b!356146 () Bool)

(declare-fun res!197605 () Bool)

(assert (=> b!356146 (=> (not res!197605) (not e!218257))))

(assert (=> b!356146 (= res!197605 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9622 _keys!1456))))))

(declare-fun b!356147 () Bool)

(declare-fun res!197603 () Bool)

(assert (=> b!356147 (=> (not res!197603) (not e!218257))))

(declare-fun arrayContainsKey!0 (array!19554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356147 (= res!197603 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356148 () Bool)

(declare-fun res!197606 () Bool)

(assert (=> b!356148 (=> (not res!197606) (not e!218257))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19554 (_ BitVec 32)) Bool)

(assert (=> b!356148 (= res!197606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356149 () Bool)

(declare-fun res!197602 () Bool)

(assert (=> b!356149 (=> (not res!197602) (not e!218257))))

(declare-datatypes ((List!5271 0))(
  ( (Nil!5268) (Cons!5267 (h!6123 (_ BitVec 64)) (t!10413 List!5271)) )
))
(declare-fun arrayNoDuplicates!0 (array!19554 (_ BitVec 32) List!5271) Bool)

(assert (=> b!356149 (= res!197602 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5268))))

(declare-fun mapNonEmpty!13506 () Bool)

(declare-fun tp!27483 () Bool)

(declare-fun e!218253 () Bool)

(assert (=> mapNonEmpty!13506 (= mapRes!13506 (and tp!27483 e!218253))))

(declare-fun mapValue!13506 () ValueCell!3656)

(declare-fun mapKey!13506 () (_ BitVec 32))

(declare-fun mapRest!13506 () (Array (_ BitVec 32) ValueCell!3656))

(assert (=> mapNonEmpty!13506 (= (arr!9271 _values!1208) (store mapRest!13506 mapKey!13506 mapValue!13506))))

(declare-fun b!356144 () Bool)

(assert (=> b!356144 (= e!218257 (not true))))

(assert (=> b!356144 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11643)

(declare-datatypes ((Unit!10945 0))(
  ( (Unit!10946) )
))
(declare-fun lt!165932 () Unit!10945)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11643)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 (array!19554 array!19556 (_ BitVec 32) (_ BitVec 32) V!11643 V!11643 (_ BitVec 64) (_ BitVec 32)) Unit!10945)

(assert (=> b!356144 (= lt!165932 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!1 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun res!197608 () Bool)

(assert (=> start!35532 (=> (not res!197608) (not e!218257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35532 (= res!197608 (validMask!0 mask!1842))))

(assert (=> start!35532 e!218257))

(declare-fun tp_is_empty!7999 () Bool)

(assert (=> start!35532 tp_is_empty!7999))

(assert (=> start!35532 true))

(declare-fun array_inv!6850 (array!19554) Bool)

(assert (=> start!35532 (array_inv!6850 _keys!1456)))

(declare-fun array_inv!6851 (array!19556) Bool)

(assert (=> start!35532 (and (array_inv!6851 _values!1208) e!218255)))

(declare-fun mapIsEmpty!13506 () Bool)

(assert (=> mapIsEmpty!13506 mapRes!13506))

(declare-fun b!356150 () Bool)

(assert (=> b!356150 (= e!218254 tp_is_empty!7999)))

(declare-fun b!356151 () Bool)

(declare-fun res!197601 () Bool)

(assert (=> b!356151 (=> (not res!197601) (not e!218257))))

(assert (=> b!356151 (= res!197601 (and (= (size!9623 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9622 _keys!1456) (size!9623 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356152 () Bool)

(assert (=> b!356152 (= e!218253 tp_is_empty!7999)))

(declare-fun b!356153 () Bool)

(declare-fun res!197604 () Bool)

(assert (=> b!356153 (=> (not res!197604) (not e!218257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356153 (= res!197604 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35532 res!197608) b!356151))

(assert (= (and b!356151 res!197601) b!356148))

(assert (= (and b!356148 res!197606) b!356149))

(assert (= (and b!356149 res!197602) b!356153))

(assert (= (and b!356153 res!197604) b!356146))

(assert (= (and b!356146 res!197605) b!356147))

(assert (= (and b!356147 res!197603) b!356143))

(assert (= (and b!356143 res!197607) b!356144))

(assert (= (and b!356145 condMapEmpty!13506) mapIsEmpty!13506))

(assert (= (and b!356145 (not condMapEmpty!13506)) mapNonEmpty!13506))

(get-info :version)

(assert (= (and mapNonEmpty!13506 ((_ is ValueCellFull!3656) mapValue!13506)) b!356152))

(assert (= (and b!356145 ((_ is ValueCellFull!3656) mapDefault!13506)) b!356150))

(assert (= start!35532 b!356145))

(declare-fun m!354897 () Bool)

(assert (=> b!356148 m!354897))

(declare-fun m!354899 () Bool)

(assert (=> b!356143 m!354899))

(declare-fun m!354901 () Bool)

(assert (=> b!356149 m!354901))

(declare-fun m!354903 () Bool)

(assert (=> b!356147 m!354903))

(declare-fun m!354905 () Bool)

(assert (=> mapNonEmpty!13506 m!354905))

(declare-fun m!354907 () Bool)

(assert (=> b!356144 m!354907))

(declare-fun m!354909 () Bool)

(assert (=> b!356144 m!354909))

(declare-fun m!354911 () Bool)

(assert (=> b!356153 m!354911))

(declare-fun m!354913 () Bool)

(assert (=> start!35532 m!354913))

(declare-fun m!354915 () Bool)

(assert (=> start!35532 m!354915))

(declare-fun m!354917 () Bool)

(assert (=> start!35532 m!354917))

(check-sat (not b!356153) (not mapNonEmpty!13506) (not b!356144) (not b!356148) (not start!35532) (not b!356149) (not b!356147) tp_is_empty!7999)
(check-sat)
