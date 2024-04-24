; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35878 () Bool)

(assert start!35878)

(declare-fun b!360767 () Bool)

(declare-fun res!200726 () Bool)

(declare-fun e!220847 () Bool)

(assert (=> b!360767 (=> (not res!200726) (not e!220847))))

(declare-datatypes ((array!20190 0))(
  ( (array!20191 (arr!9587 (Array (_ BitVec 32) (_ BitVec 64))) (size!9939 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20190)

(declare-datatypes ((List!5407 0))(
  ( (Nil!5404) (Cons!5403 (h!6259 (_ BitVec 64)) (t!10549 List!5407)) )
))
(declare-fun arrayNoDuplicates!0 (array!20190 (_ BitVec 32) List!5407) Bool)

(assert (=> b!360767 (= res!200726 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5404))))

(declare-fun b!360768 () Bool)

(declare-fun res!200724 () Bool)

(assert (=> b!360768 (=> (not res!200724) (not e!220847))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360768 (= res!200724 (validKeyInArray!0 k0!1077))))

(declare-fun b!360769 () Bool)

(declare-fun e!220848 () Bool)

(declare-fun e!220844 () Bool)

(declare-fun mapRes!14004 () Bool)

(assert (=> b!360769 (= e!220848 (and e!220844 mapRes!14004))))

(declare-fun condMapEmpty!14004 () Bool)

(declare-datatypes ((V!12083 0))(
  ( (V!12084 (val!4209 Int)) )
))
(declare-datatypes ((ValueCell!3821 0))(
  ( (ValueCellFull!3821 (v!6404 V!12083)) (EmptyCell!3821) )
))
(declare-datatypes ((array!20192 0))(
  ( (array!20193 (arr!9588 (Array (_ BitVec 32) ValueCell!3821)) (size!9940 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20192)

(declare-fun mapDefault!14004 () ValueCell!3821)

(assert (=> b!360769 (= condMapEmpty!14004 (= (arr!9588 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3821)) mapDefault!14004)))))

(declare-fun mapNonEmpty!14004 () Bool)

(declare-fun tp!28071 () Bool)

(declare-fun e!220845 () Bool)

(assert (=> mapNonEmpty!14004 (= mapRes!14004 (and tp!28071 e!220845))))

(declare-fun mapKey!14004 () (_ BitVec 32))

(declare-fun mapValue!14004 () ValueCell!3821)

(declare-fun mapRest!14004 () (Array (_ BitVec 32) ValueCell!3821))

(assert (=> mapNonEmpty!14004 (= (arr!9588 _values!1208) (store mapRest!14004 mapKey!14004 mapValue!14004))))

(declare-fun b!360770 () Bool)

(declare-fun res!200725 () Bool)

(assert (=> b!360770 (=> (not res!200725) (not e!220847))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360770 (= res!200725 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360771 () Bool)

(declare-fun res!200727 () Bool)

(assert (=> b!360771 (=> (not res!200727) (not e!220847))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20190 (_ BitVec 32)) Bool)

(assert (=> b!360771 (= res!200727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!200720 () Bool)

(assert (=> start!35878 (=> (not res!200720) (not e!220847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35878 (= res!200720 (validMask!0 mask!1842))))

(assert (=> start!35878 e!220847))

(declare-fun tp_is_empty!8329 () Bool)

(assert (=> start!35878 tp_is_empty!8329))

(assert (=> start!35878 true))

(declare-fun array_inv!7086 (array!20190) Bool)

(assert (=> start!35878 (array_inv!7086 _keys!1456)))

(declare-fun array_inv!7087 (array!20192) Bool)

(assert (=> start!35878 (and (array_inv!7087 _values!1208) e!220848)))

(declare-fun b!360772 () Bool)

(assert (=> b!360772 (= e!220845 tp_is_empty!8329)))

(declare-fun b!360773 () Bool)

(assert (=> b!360773 (= e!220847 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9939 _keys!1456)) (bvslt (bvsub (size!9939 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) (bvsub (size!9939 _keys!1456) from!1805)))))))

(assert (=> b!360773 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12083)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12083)

(declare-datatypes ((Unit!11087 0))(
  ( (Unit!11088) )
))
(declare-fun lt!166511 () Unit!11087)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 (array!20190 array!20192 (_ BitVec 32) (_ BitVec 32) V!12083 V!12083 (_ BitVec 64) (_ BitVec 32)) Unit!11087)

(assert (=> b!360773 (= lt!166511 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360774 () Bool)

(declare-fun res!200721 () Bool)

(assert (=> b!360774 (=> (not res!200721) (not e!220847))))

(assert (=> b!360774 (= res!200721 (and (= (size!9940 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9939 _keys!1456) (size!9940 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360775 () Bool)

(declare-fun res!200722 () Bool)

(assert (=> b!360775 (=> (not res!200722) (not e!220847))))

(assert (=> b!360775 (= res!200722 (not (= (select (arr!9587 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360776 () Bool)

(assert (=> b!360776 (= e!220844 tp_is_empty!8329)))

(declare-fun b!360777 () Bool)

(declare-fun res!200723 () Bool)

(assert (=> b!360777 (=> (not res!200723) (not e!220847))))

(assert (=> b!360777 (= res!200723 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9939 _keys!1456))))))

(declare-fun mapIsEmpty!14004 () Bool)

(assert (=> mapIsEmpty!14004 mapRes!14004))

(assert (= (and start!35878 res!200720) b!360774))

(assert (= (and b!360774 res!200721) b!360771))

(assert (= (and b!360771 res!200727) b!360767))

(assert (= (and b!360767 res!200726) b!360768))

(assert (= (and b!360768 res!200724) b!360777))

(assert (= (and b!360777 res!200723) b!360770))

(assert (= (and b!360770 res!200725) b!360775))

(assert (= (and b!360775 res!200722) b!360773))

(assert (= (and b!360769 condMapEmpty!14004) mapIsEmpty!14004))

(assert (= (and b!360769 (not condMapEmpty!14004)) mapNonEmpty!14004))

(get-info :version)

(assert (= (and mapNonEmpty!14004 ((_ is ValueCellFull!3821) mapValue!14004)) b!360772))

(assert (= (and b!360769 ((_ is ValueCellFull!3821) mapDefault!14004)) b!360776))

(assert (= start!35878 b!360769))

(declare-fun m!358079 () Bool)

(assert (=> b!360767 m!358079))

(declare-fun m!358081 () Bool)

(assert (=> mapNonEmpty!14004 m!358081))

(declare-fun m!358083 () Bool)

(assert (=> b!360773 m!358083))

(declare-fun m!358085 () Bool)

(assert (=> b!360773 m!358085))

(declare-fun m!358087 () Bool)

(assert (=> b!360770 m!358087))

(declare-fun m!358089 () Bool)

(assert (=> start!35878 m!358089))

(declare-fun m!358091 () Bool)

(assert (=> start!35878 m!358091))

(declare-fun m!358093 () Bool)

(assert (=> start!35878 m!358093))

(declare-fun m!358095 () Bool)

(assert (=> b!360768 m!358095))

(declare-fun m!358097 () Bool)

(assert (=> b!360775 m!358097))

(declare-fun m!358099 () Bool)

(assert (=> b!360771 m!358099))

(check-sat (not mapNonEmpty!14004) (not b!360770) tp_is_empty!8329 (not b!360773) (not b!360771) (not b!360767) (not start!35878) (not b!360768))
(check-sat)
