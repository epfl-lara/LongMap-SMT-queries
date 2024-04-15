; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35878 () Bool)

(assert start!35878)

(declare-fun res!200594 () Bool)

(declare-fun e!220705 () Bool)

(assert (=> start!35878 (=> (not res!200594) (not e!220705))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35878 (= res!200594 (validMask!0 mask!1842))))

(assert (=> start!35878 e!220705))

(declare-fun tp_is_empty!8329 () Bool)

(assert (=> start!35878 tp_is_empty!8329))

(assert (=> start!35878 true))

(declare-datatypes ((array!20185 0))(
  ( (array!20186 (arr!9585 (Array (_ BitVec 32) (_ BitVec 64))) (size!9938 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20185)

(declare-fun array_inv!7064 (array!20185) Bool)

(assert (=> start!35878 (array_inv!7064 _keys!1456)))

(declare-datatypes ((V!12083 0))(
  ( (V!12084 (val!4209 Int)) )
))
(declare-datatypes ((ValueCell!3821 0))(
  ( (ValueCellFull!3821 (v!6397 V!12083)) (EmptyCell!3821) )
))
(declare-datatypes ((array!20187 0))(
  ( (array!20188 (arr!9586 (Array (_ BitVec 32) ValueCell!3821)) (size!9939 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20187)

(declare-fun e!220706 () Bool)

(declare-fun array_inv!7065 (array!20187) Bool)

(assert (=> start!35878 (and (array_inv!7065 _values!1208) e!220706)))

(declare-fun b!360545 () Bool)

(declare-fun res!200599 () Bool)

(assert (=> b!360545 (=> (not res!200599) (not e!220705))))

(declare-datatypes ((List!5463 0))(
  ( (Nil!5460) (Cons!5459 (h!6315 (_ BitVec 64)) (t!10604 List!5463)) )
))
(declare-fun arrayNoDuplicates!0 (array!20185 (_ BitVec 32) List!5463) Bool)

(assert (=> b!360545 (= res!200599 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5460))))

(declare-fun b!360546 () Bool)

(declare-fun e!220704 () Bool)

(assert (=> b!360546 (= e!220704 tp_is_empty!8329)))

(declare-fun b!360547 () Bool)

(declare-fun mapRes!14004 () Bool)

(assert (=> b!360547 (= e!220706 (and e!220704 mapRes!14004))))

(declare-fun condMapEmpty!14004 () Bool)

(declare-fun mapDefault!14004 () ValueCell!3821)

(assert (=> b!360547 (= condMapEmpty!14004 (= (arr!9586 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3821)) mapDefault!14004)))))

(declare-fun b!360548 () Bool)

(declare-fun res!200596 () Bool)

(assert (=> b!360548 (=> (not res!200596) (not e!220705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20185 (_ BitVec 32)) Bool)

(assert (=> b!360548 (= res!200596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360549 () Bool)

(declare-fun res!200598 () Bool)

(assert (=> b!360549 (=> (not res!200598) (not e!220705))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360549 (= res!200598 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9938 _keys!1456))))))

(declare-fun mapIsEmpty!14004 () Bool)

(assert (=> mapIsEmpty!14004 mapRes!14004))

(declare-fun b!360550 () Bool)

(declare-fun res!200600 () Bool)

(assert (=> b!360550 (=> (not res!200600) (not e!220705))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360550 (= res!200600 (validKeyInArray!0 k0!1077))))

(declare-fun b!360551 () Bool)

(declare-fun e!220703 () Bool)

(assert (=> b!360551 (= e!220703 tp_is_empty!8329)))

(declare-fun b!360552 () Bool)

(assert (=> b!360552 (= e!220705 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9938 _keys!1456)) (bvslt (bvsub (size!9938 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) (bvsub (size!9938 _keys!1456) from!1805)))))))

(declare-fun arrayContainsKey!0 (array!20185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360552 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12083)

(declare-datatypes ((Unit!11082 0))(
  ( (Unit!11083) )
))
(declare-fun lt!166258 () Unit!11082)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12083)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!64 (array!20185 array!20187 (_ BitVec 32) (_ BitVec 32) V!12083 V!12083 (_ BitVec 64) (_ BitVec 32)) Unit!11082)

(assert (=> b!360552 (= lt!166258 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!64 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!14004 () Bool)

(declare-fun tp!28071 () Bool)

(assert (=> mapNonEmpty!14004 (= mapRes!14004 (and tp!28071 e!220703))))

(declare-fun mapValue!14004 () ValueCell!3821)

(declare-fun mapKey!14004 () (_ BitVec 32))

(declare-fun mapRest!14004 () (Array (_ BitVec 32) ValueCell!3821))

(assert (=> mapNonEmpty!14004 (= (arr!9586 _values!1208) (store mapRest!14004 mapKey!14004 mapValue!14004))))

(declare-fun b!360553 () Bool)

(declare-fun res!200601 () Bool)

(assert (=> b!360553 (=> (not res!200601) (not e!220705))))

(assert (=> b!360553 (= res!200601 (not (= (select (arr!9585 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360554 () Bool)

(declare-fun res!200597 () Bool)

(assert (=> b!360554 (=> (not res!200597) (not e!220705))))

(assert (=> b!360554 (= res!200597 (and (= (size!9939 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9938 _keys!1456) (size!9939 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360555 () Bool)

(declare-fun res!200595 () Bool)

(assert (=> b!360555 (=> (not res!200595) (not e!220705))))

(assert (=> b!360555 (= res!200595 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35878 res!200594) b!360554))

(assert (= (and b!360554 res!200597) b!360548))

(assert (= (and b!360548 res!200596) b!360545))

(assert (= (and b!360545 res!200599) b!360550))

(assert (= (and b!360550 res!200600) b!360549))

(assert (= (and b!360549 res!200598) b!360555))

(assert (= (and b!360555 res!200595) b!360553))

(assert (= (and b!360553 res!200601) b!360552))

(assert (= (and b!360547 condMapEmpty!14004) mapIsEmpty!14004))

(assert (= (and b!360547 (not condMapEmpty!14004)) mapNonEmpty!14004))

(get-info :version)

(assert (= (and mapNonEmpty!14004 ((_ is ValueCellFull!3821) mapValue!14004)) b!360551))

(assert (= (and b!360547 ((_ is ValueCellFull!3821) mapDefault!14004)) b!360546))

(assert (= start!35878 b!360547))

(declare-fun m!357125 () Bool)

(assert (=> b!360553 m!357125))

(declare-fun m!357127 () Bool)

(assert (=> b!360548 m!357127))

(declare-fun m!357129 () Bool)

(assert (=> b!360545 m!357129))

(declare-fun m!357131 () Bool)

(assert (=> b!360550 m!357131))

(declare-fun m!357133 () Bool)

(assert (=> b!360555 m!357133))

(declare-fun m!357135 () Bool)

(assert (=> mapNonEmpty!14004 m!357135))

(declare-fun m!357137 () Bool)

(assert (=> b!360552 m!357137))

(declare-fun m!357139 () Bool)

(assert (=> b!360552 m!357139))

(declare-fun m!357141 () Bool)

(assert (=> start!35878 m!357141))

(declare-fun m!357143 () Bool)

(assert (=> start!35878 m!357143))

(declare-fun m!357145 () Bool)

(assert (=> start!35878 m!357145))

(check-sat (not b!360555) (not b!360552) (not start!35878) (not b!360548) (not mapNonEmpty!14004) tp_is_empty!8329 (not b!360550) (not b!360545))
(check-sat)
