; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35812 () Bool)

(assert start!35812)

(declare-fun b!359721 () Bool)

(declare-fun res!199936 () Bool)

(declare-fun e!220366 () Bool)

(assert (=> b!359721 (=> (not res!199936) (not e!220366))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20083 0))(
  ( (array!20084 (arr!9535 (Array (_ BitVec 32) (_ BitVec 64))) (size!9887 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20083)

(declare-datatypes ((V!11997 0))(
  ( (V!11998 (val!4177 Int)) )
))
(declare-datatypes ((ValueCell!3789 0))(
  ( (ValueCellFull!3789 (v!6371 V!11997)) (EmptyCell!3789) )
))
(declare-datatypes ((array!20085 0))(
  ( (array!20086 (arr!9536 (Array (_ BitVec 32) ValueCell!3789)) (size!9888 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20085)

(assert (=> b!359721 (= res!199936 (and (= (size!9888 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9887 _keys!1456) (size!9888 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359722 () Bool)

(declare-fun res!199938 () Bool)

(assert (=> b!359722 (=> (not res!199938) (not e!220366))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!359722 (= res!199938 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9887 _keys!1456))))))

(declare-fun res!199932 () Bool)

(assert (=> start!35812 (=> (not res!199932) (not e!220366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35812 (= res!199932 (validMask!0 mask!1842))))

(assert (=> start!35812 e!220366))

(declare-fun tp_is_empty!8265 () Bool)

(assert (=> start!35812 tp_is_empty!8265))

(assert (=> start!35812 true))

(declare-fun array_inv!7012 (array!20083) Bool)

(assert (=> start!35812 (array_inv!7012 _keys!1456)))

(declare-fun e!220364 () Bool)

(declare-fun array_inv!7013 (array!20085) Bool)

(assert (=> start!35812 (and (array_inv!7013 _values!1208) e!220364)))

(declare-fun b!359723 () Bool)

(declare-fun res!199939 () Bool)

(assert (=> b!359723 (=> (not res!199939) (not e!220366))))

(declare-datatypes ((List!5477 0))(
  ( (Nil!5474) (Cons!5473 (h!6329 (_ BitVec 64)) (t!10627 List!5477)) )
))
(declare-fun arrayNoDuplicates!0 (array!20083 (_ BitVec 32) List!5477) Bool)

(assert (=> b!359723 (= res!199939 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5474))))

(declare-fun mapNonEmpty!13905 () Bool)

(declare-fun mapRes!13905 () Bool)

(declare-fun tp!27972 () Bool)

(declare-fun e!220367 () Bool)

(assert (=> mapNonEmpty!13905 (= mapRes!13905 (and tp!27972 e!220367))))

(declare-fun mapKey!13905 () (_ BitVec 32))

(declare-fun mapValue!13905 () ValueCell!3789)

(declare-fun mapRest!13905 () (Array (_ BitVec 32) ValueCell!3789))

(assert (=> mapNonEmpty!13905 (= (arr!9536 _values!1208) (store mapRest!13905 mapKey!13905 mapValue!13905))))

(declare-fun b!359724 () Bool)

(declare-fun res!199935 () Bool)

(assert (=> b!359724 (=> (not res!199935) (not e!220366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20083 (_ BitVec 32)) Bool)

(assert (=> b!359724 (= res!199935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359725 () Bool)

(assert (=> b!359725 (= e!220366 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359725 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11997)

(declare-datatypes ((Unit!11056 0))(
  ( (Unit!11057) )
))
(declare-fun lt!166385 () Unit!11056)

(declare-fun zeroValue!1150 () V!11997)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!43 (array!20083 array!20085 (_ BitVec 32) (_ BitVec 32) V!11997 V!11997 (_ BitVec 64) (_ BitVec 32)) Unit!11056)

(assert (=> b!359725 (= lt!166385 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!43 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359726 () Bool)

(declare-fun e!220365 () Bool)

(assert (=> b!359726 (= e!220365 tp_is_empty!8265)))

(declare-fun b!359727 () Bool)

(assert (=> b!359727 (= e!220364 (and e!220365 mapRes!13905))))

(declare-fun condMapEmpty!13905 () Bool)

(declare-fun mapDefault!13905 () ValueCell!3789)

(assert (=> b!359727 (= condMapEmpty!13905 (= (arr!9536 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3789)) mapDefault!13905)))))

(declare-fun b!359728 () Bool)

(declare-fun res!199934 () Bool)

(assert (=> b!359728 (=> (not res!199934) (not e!220366))))

(assert (=> b!359728 (= res!199934 (not (= (select (arr!9535 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!359729 () Bool)

(declare-fun res!199933 () Bool)

(assert (=> b!359729 (=> (not res!199933) (not e!220366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359729 (= res!199933 (validKeyInArray!0 k0!1077))))

(declare-fun b!359730 () Bool)

(assert (=> b!359730 (= e!220367 tp_is_empty!8265)))

(declare-fun mapIsEmpty!13905 () Bool)

(assert (=> mapIsEmpty!13905 mapRes!13905))

(declare-fun b!359731 () Bool)

(declare-fun res!199937 () Bool)

(assert (=> b!359731 (=> (not res!199937) (not e!220366))))

(assert (=> b!359731 (= res!199937 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35812 res!199932) b!359721))

(assert (= (and b!359721 res!199936) b!359724))

(assert (= (and b!359724 res!199935) b!359723))

(assert (= (and b!359723 res!199939) b!359729))

(assert (= (and b!359729 res!199933) b!359722))

(assert (= (and b!359722 res!199938) b!359731))

(assert (= (and b!359731 res!199937) b!359728))

(assert (= (and b!359728 res!199934) b!359725))

(assert (= (and b!359727 condMapEmpty!13905) mapIsEmpty!13905))

(assert (= (and b!359727 (not condMapEmpty!13905)) mapNonEmpty!13905))

(get-info :version)

(assert (= (and mapNonEmpty!13905 ((_ is ValueCellFull!3789) mapValue!13905)) b!359730))

(assert (= (and b!359727 ((_ is ValueCellFull!3789) mapDefault!13905)) b!359726))

(assert (= start!35812 b!359727))

(declare-fun m!357125 () Bool)

(assert (=> b!359731 m!357125))

(declare-fun m!357127 () Bool)

(assert (=> b!359725 m!357127))

(declare-fun m!357129 () Bool)

(assert (=> b!359725 m!357129))

(declare-fun m!357131 () Bool)

(assert (=> b!359723 m!357131))

(declare-fun m!357133 () Bool)

(assert (=> b!359728 m!357133))

(declare-fun m!357135 () Bool)

(assert (=> b!359724 m!357135))

(declare-fun m!357137 () Bool)

(assert (=> mapNonEmpty!13905 m!357137))

(declare-fun m!357139 () Bool)

(assert (=> b!359729 m!357139))

(declare-fun m!357141 () Bool)

(assert (=> start!35812 m!357141))

(declare-fun m!357143 () Bool)

(assert (=> start!35812 m!357143))

(declare-fun m!357145 () Bool)

(assert (=> start!35812 m!357145))

(check-sat tp_is_empty!8265 (not b!359731) (not b!359724) (not b!359725) (not mapNonEmpty!13905) (not start!35812) (not b!359723) (not b!359729))
(check-sat)
