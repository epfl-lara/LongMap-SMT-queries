; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84258 () Bool)

(assert start!84258)

(declare-fun b!985795 () Bool)

(declare-fun res!659655 () Bool)

(declare-fun e!555672 () Bool)

(assert (=> b!985795 (=> (not res!659655) (not e!555672))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35731 0))(
  ( (V!35732 (val!11581 Int)) )
))
(declare-datatypes ((ValueCell!11049 0))(
  ( (ValueCellFull!11049 (v!14143 V!35731)) (EmptyCell!11049) )
))
(declare-datatypes ((array!62097 0))(
  ( (array!62098 (arr!29906 (Array (_ BitVec 32) ValueCell!11049)) (size!30385 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62097)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62099 0))(
  ( (array!62100 (arr!29907 (Array (_ BitVec 32) (_ BitVec 64))) (size!30386 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62099)

(assert (=> b!985795 (= res!659655 (and (= (size!30385 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30386 _keys!1544) (size!30385 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985796 () Bool)

(declare-fun res!659657 () Bool)

(assert (=> b!985796 (=> (not res!659657) (not e!555672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62099 (_ BitVec 32)) Bool)

(assert (=> b!985796 (= res!659657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985797 () Bool)

(declare-fun e!555670 () Bool)

(declare-fun e!555669 () Bool)

(declare-fun mapRes!36620 () Bool)

(assert (=> b!985797 (= e!555670 (and e!555669 mapRes!36620))))

(declare-fun condMapEmpty!36620 () Bool)

(declare-fun mapDefault!36620 () ValueCell!11049)

(assert (=> b!985797 (= condMapEmpty!36620 (= (arr!29906 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11049)) mapDefault!36620)))))

(declare-fun mapIsEmpty!36620 () Bool)

(assert (=> mapIsEmpty!36620 mapRes!36620))

(declare-fun b!985798 () Bool)

(declare-fun e!555671 () Bool)

(declare-fun tp_is_empty!23061 () Bool)

(assert (=> b!985798 (= e!555671 tp_is_empty!23061)))

(declare-fun res!659656 () Bool)

(assert (=> start!84258 (=> (not res!659656) (not e!555672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84258 (= res!659656 (validMask!0 mask!1948))))

(assert (=> start!84258 e!555672))

(assert (=> start!84258 true))

(declare-fun array_inv!23113 (array!62097) Bool)

(assert (=> start!84258 (and (array_inv!23113 _values!1278) e!555670)))

(declare-fun array_inv!23114 (array!62099) Bool)

(assert (=> start!84258 (array_inv!23114 _keys!1544)))

(declare-fun mapNonEmpty!36620 () Bool)

(declare-fun tp!69475 () Bool)

(assert (=> mapNonEmpty!36620 (= mapRes!36620 (and tp!69475 e!555671))))

(declare-fun mapRest!36620 () (Array (_ BitVec 32) ValueCell!11049))

(declare-fun mapValue!36620 () ValueCell!11049)

(declare-fun mapKey!36620 () (_ BitVec 32))

(assert (=> mapNonEmpty!36620 (= (arr!29906 _values!1278) (store mapRest!36620 mapKey!36620 mapValue!36620))))

(declare-fun b!985799 () Bool)

(assert (=> b!985799 (= e!555672 false)))

(declare-fun lt!437387 () Bool)

(declare-datatypes ((List!20715 0))(
  ( (Nil!20712) (Cons!20711 (h!21873 (_ BitVec 64)) (t!29614 List!20715)) )
))
(declare-fun arrayNoDuplicates!0 (array!62099 (_ BitVec 32) List!20715) Bool)

(assert (=> b!985799 (= lt!437387 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20712))))

(declare-fun b!985800 () Bool)

(assert (=> b!985800 (= e!555669 tp_is_empty!23061)))

(assert (= (and start!84258 res!659656) b!985795))

(assert (= (and b!985795 res!659655) b!985796))

(assert (= (and b!985796 res!659657) b!985799))

(assert (= (and b!985797 condMapEmpty!36620) mapIsEmpty!36620))

(assert (= (and b!985797 (not condMapEmpty!36620)) mapNonEmpty!36620))

(get-info :version)

(assert (= (and mapNonEmpty!36620 ((_ is ValueCellFull!11049) mapValue!36620)) b!985798))

(assert (= (and b!985797 ((_ is ValueCellFull!11049) mapDefault!36620)) b!985800))

(assert (= start!84258 b!985797))

(declare-fun m!912847 () Bool)

(assert (=> b!985796 m!912847))

(declare-fun m!912849 () Bool)

(assert (=> start!84258 m!912849))

(declare-fun m!912851 () Bool)

(assert (=> start!84258 m!912851))

(declare-fun m!912853 () Bool)

(assert (=> start!84258 m!912853))

(declare-fun m!912855 () Bool)

(assert (=> mapNonEmpty!36620 m!912855))

(declare-fun m!912857 () Bool)

(assert (=> b!985799 m!912857))

(check-sat tp_is_empty!23061 (not b!985796) (not start!84258) (not b!985799) (not mapNonEmpty!36620))
(check-sat)
