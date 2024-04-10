; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35894 () Bool)

(assert start!35894)

(declare-fun mapIsEmpty!14007 () Bool)

(declare-fun mapRes!14007 () Bool)

(assert (=> mapIsEmpty!14007 mapRes!14007))

(declare-fun b!360854 () Bool)

(declare-fun res!200753 () Bool)

(declare-fun e!220893 () Bool)

(assert (=> b!360854 (=> (not res!200753) (not e!220893))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360854 (= res!200753 (validKeyInArray!0 k0!1077))))

(declare-fun b!360855 () Bool)

(declare-fun res!200747 () Bool)

(assert (=> b!360855 (=> (not res!200747) (not e!220893))))

(declare-datatypes ((array!20215 0))(
  ( (array!20216 (arr!9600 (Array (_ BitVec 32) (_ BitVec 64))) (size!9952 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20215)

(declare-datatypes ((List!5496 0))(
  ( (Nil!5493) (Cons!5492 (h!6348 (_ BitVec 64)) (t!10646 List!5496)) )
))
(declare-fun arrayNoDuplicates!0 (array!20215 (_ BitVec 32) List!5496) Bool)

(assert (=> b!360855 (= res!200747 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5493))))

(declare-fun b!360856 () Bool)

(declare-fun res!200749 () Bool)

(assert (=> b!360856 (=> (not res!200749) (not e!220893))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360856 (= res!200749 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360857 () Bool)

(declare-fun e!220897 () Bool)

(declare-fun tp_is_empty!8331 () Bool)

(assert (=> b!360857 (= e!220897 tp_is_empty!8331)))

(declare-fun b!360858 () Bool)

(declare-fun res!200748 () Bool)

(assert (=> b!360858 (=> (not res!200748) (not e!220893))))

(assert (=> b!360858 (= res!200748 (not (= (select (arr!9600 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360859 () Bool)

(declare-fun e!220896 () Bool)

(declare-fun e!220894 () Bool)

(assert (=> b!360859 (= e!220896 (and e!220894 mapRes!14007))))

(declare-fun condMapEmpty!14007 () Bool)

(declare-datatypes ((V!12085 0))(
  ( (V!12086 (val!4210 Int)) )
))
(declare-datatypes ((ValueCell!3822 0))(
  ( (ValueCellFull!3822 (v!6404 V!12085)) (EmptyCell!3822) )
))
(declare-datatypes ((array!20217 0))(
  ( (array!20218 (arr!9601 (Array (_ BitVec 32) ValueCell!3822)) (size!9953 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20217)

(declare-fun mapDefault!14007 () ValueCell!3822)

(assert (=> b!360859 (= condMapEmpty!14007 (= (arr!9601 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3822)) mapDefault!14007)))))

(declare-fun b!360860 () Bool)

(assert (=> b!360860 (= e!220894 tp_is_empty!8331)))

(declare-fun b!360861 () Bool)

(declare-fun res!200752 () Bool)

(assert (=> b!360861 (=> (not res!200752) (not e!220893))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20215 (_ BitVec 32)) Bool)

(assert (=> b!360861 (= res!200752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360853 () Bool)

(declare-fun res!200751 () Bool)

(assert (=> b!360853 (=> (not res!200751) (not e!220893))))

(assert (=> b!360853 (= res!200751 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9952 _keys!1456))))))

(declare-fun res!200750 () Bool)

(assert (=> start!35894 (=> (not res!200750) (not e!220893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35894 (= res!200750 (validMask!0 mask!1842))))

(assert (=> start!35894 e!220893))

(assert (=> start!35894 tp_is_empty!8331))

(assert (=> start!35894 true))

(declare-fun array_inv!7062 (array!20215) Bool)

(assert (=> start!35894 (array_inv!7062 _keys!1456)))

(declare-fun array_inv!7063 (array!20217) Bool)

(assert (=> start!35894 (and (array_inv!7063 _values!1208) e!220896)))

(declare-fun b!360862 () Bool)

(declare-fun res!200754 () Bool)

(assert (=> b!360862 (=> (not res!200754) (not e!220893))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!360862 (= res!200754 (and (= (size!9953 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9952 _keys!1456) (size!9953 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14007 () Bool)

(declare-fun tp!28074 () Bool)

(assert (=> mapNonEmpty!14007 (= mapRes!14007 (and tp!28074 e!220897))))

(declare-fun mapRest!14007 () (Array (_ BitVec 32) ValueCell!3822))

(declare-fun mapKey!14007 () (_ BitVec 32))

(declare-fun mapValue!14007 () ValueCell!3822)

(assert (=> mapNonEmpty!14007 (= (arr!9601 _values!1208) (store mapRest!14007 mapKey!14007 mapValue!14007))))

(declare-fun b!360863 () Bool)

(assert (=> b!360863 (= e!220893 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9952 _keys!1456)) (bvslt (bvsub (size!9952 _keys!1456) (bvadd #b00000000000000000000000000000001 from!1805)) (bvsub (size!9952 _keys!1456) from!1805)))))))

(assert (=> b!360863 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12085)

(declare-fun zeroValue!1150 () V!12085)

(declare-datatypes ((Unit!11100 0))(
  ( (Unit!11101) )
))
(declare-fun lt!166496 () Unit!11100)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 (array!20215 array!20217 (_ BitVec 32) (_ BitVec 32) V!12085 V!12085 (_ BitVec 64) (_ BitVec 32)) Unit!11100)

(assert (=> b!360863 (= lt!166496 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!65 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (= (and start!35894 res!200750) b!360862))

(assert (= (and b!360862 res!200754) b!360861))

(assert (= (and b!360861 res!200752) b!360855))

(assert (= (and b!360855 res!200747) b!360854))

(assert (= (and b!360854 res!200753) b!360853))

(assert (= (and b!360853 res!200751) b!360856))

(assert (= (and b!360856 res!200749) b!360858))

(assert (= (and b!360858 res!200748) b!360863))

(assert (= (and b!360859 condMapEmpty!14007) mapIsEmpty!14007))

(assert (= (and b!360859 (not condMapEmpty!14007)) mapNonEmpty!14007))

(get-info :version)

(assert (= (and mapNonEmpty!14007 ((_ is ValueCellFull!3822) mapValue!14007)) b!360857))

(assert (= (and b!360859 ((_ is ValueCellFull!3822) mapDefault!14007)) b!360860))

(assert (= start!35894 b!360859))

(declare-fun m!357877 () Bool)

(assert (=> b!360854 m!357877))

(declare-fun m!357879 () Bool)

(assert (=> mapNonEmpty!14007 m!357879))

(declare-fun m!357881 () Bool)

(assert (=> b!360861 m!357881))

(declare-fun m!357883 () Bool)

(assert (=> b!360863 m!357883))

(declare-fun m!357885 () Bool)

(assert (=> b!360863 m!357885))

(declare-fun m!357887 () Bool)

(assert (=> b!360856 m!357887))

(declare-fun m!357889 () Bool)

(assert (=> start!35894 m!357889))

(declare-fun m!357891 () Bool)

(assert (=> start!35894 m!357891))

(declare-fun m!357893 () Bool)

(assert (=> start!35894 m!357893))

(declare-fun m!357895 () Bool)

(assert (=> b!360858 m!357895))

(declare-fun m!357897 () Bool)

(assert (=> b!360855 m!357897))

(check-sat (not mapNonEmpty!14007) (not b!360856) (not b!360863) (not b!360855) (not start!35894) (not b!360861) tp_is_empty!8331 (not b!360854))
(check-sat)
