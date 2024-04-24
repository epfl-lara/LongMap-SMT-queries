; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38450 () Bool)

(assert start!38450)

(declare-fun res!227818 () Bool)

(declare-fun e!240100 () Bool)

(assert (=> start!38450 (=> (not res!227818) (not e!240100))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23668 0))(
  ( (array!23669 (arr!11283 (Array (_ BitVec 32) (_ BitVec 64))) (size!11635 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23668)

(assert (=> start!38450 (= res!227818 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11635 _keys!709))))))

(assert (=> start!38450 e!240100))

(assert (=> start!38450 true))

(declare-datatypes ((V!14283 0))(
  ( (V!14284 (val!4986 Int)) )
))
(declare-datatypes ((ValueCell!4598 0))(
  ( (ValueCellFull!4598 (v!7234 V!14283)) (EmptyCell!4598) )
))
(declare-datatypes ((array!23670 0))(
  ( (array!23671 (arr!11284 (Array (_ BitVec 32) ValueCell!4598)) (size!11636 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23670)

(declare-fun e!240097 () Bool)

(declare-fun array_inv!8338 (array!23670) Bool)

(assert (=> start!38450 (and (array_inv!8338 _values!549) e!240097)))

(declare-fun array_inv!8339 (array!23668) Bool)

(assert (=> start!38450 (array_inv!8339 _keys!709)))

(declare-fun mapIsEmpty!16446 () Bool)

(declare-fun mapRes!16446 () Bool)

(assert (=> mapIsEmpty!16446 mapRes!16446))

(declare-fun b!396895 () Bool)

(declare-fun e!240099 () Bool)

(assert (=> b!396895 (= e!240100 e!240099)))

(declare-fun res!227822 () Bool)

(assert (=> b!396895 (=> (not res!227822) (not e!240099))))

(declare-fun lt!187248 () array!23668)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23668 (_ BitVec 32)) Bool)

(assert (=> b!396895 (= res!227822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187248 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396895 (= lt!187248 (array!23669 (store (arr!11283 _keys!709) i!563 k0!794) (size!11635 _keys!709)))))

(declare-fun b!396896 () Bool)

(declare-fun res!227825 () Bool)

(assert (=> b!396896 (=> (not res!227825) (not e!240100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396896 (= res!227825 (validKeyInArray!0 k0!794))))

(declare-fun b!396897 () Bool)

(declare-fun res!227819 () Bool)

(assert (=> b!396897 (=> (not res!227819) (not e!240100))))

(assert (=> b!396897 (= res!227819 (or (= (select (arr!11283 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11283 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396898 () Bool)

(declare-fun res!227817 () Bool)

(assert (=> b!396898 (=> (not res!227817) (not e!240100))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396898 (= res!227817 (and (= (size!11636 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11635 _keys!709) (size!11636 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396899 () Bool)

(declare-fun res!227821 () Bool)

(assert (=> b!396899 (=> (not res!227821) (not e!240100))))

(declare-fun arrayContainsKey!0 (array!23668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396899 (= res!227821 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396900 () Bool)

(assert (=> b!396900 (= e!240099 false)))

(declare-fun lt!187247 () Bool)

(declare-datatypes ((List!6404 0))(
  ( (Nil!6401) (Cons!6400 (h!7256 (_ BitVec 64)) (t!11570 List!6404)) )
))
(declare-fun arrayNoDuplicates!0 (array!23668 (_ BitVec 32) List!6404) Bool)

(assert (=> b!396900 (= lt!187247 (arrayNoDuplicates!0 lt!187248 #b00000000000000000000000000000000 Nil!6401))))

(declare-fun b!396901 () Bool)

(declare-fun e!240095 () Bool)

(declare-fun tp_is_empty!9883 () Bool)

(assert (=> b!396901 (= e!240095 tp_is_empty!9883)))

(declare-fun b!396902 () Bool)

(declare-fun e!240096 () Bool)

(assert (=> b!396902 (= e!240096 tp_is_empty!9883)))

(declare-fun b!396903 () Bool)

(assert (=> b!396903 (= e!240097 (and e!240095 mapRes!16446))))

(declare-fun condMapEmpty!16446 () Bool)

(declare-fun mapDefault!16446 () ValueCell!4598)

(assert (=> b!396903 (= condMapEmpty!16446 (= (arr!11284 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4598)) mapDefault!16446)))))

(declare-fun b!396904 () Bool)

(declare-fun res!227824 () Bool)

(assert (=> b!396904 (=> (not res!227824) (not e!240100))))

(assert (=> b!396904 (= res!227824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396905 () Bool)

(declare-fun res!227823 () Bool)

(assert (=> b!396905 (=> (not res!227823) (not e!240100))))

(assert (=> b!396905 (= res!227823 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6401))))

(declare-fun mapNonEmpty!16446 () Bool)

(declare-fun tp!32241 () Bool)

(assert (=> mapNonEmpty!16446 (= mapRes!16446 (and tp!32241 e!240096))))

(declare-fun mapValue!16446 () ValueCell!4598)

(declare-fun mapKey!16446 () (_ BitVec 32))

(declare-fun mapRest!16446 () (Array (_ BitVec 32) ValueCell!4598))

(assert (=> mapNonEmpty!16446 (= (arr!11284 _values!549) (store mapRest!16446 mapKey!16446 mapValue!16446))))

(declare-fun b!396906 () Bool)

(declare-fun res!227826 () Bool)

(assert (=> b!396906 (=> (not res!227826) (not e!240100))))

(assert (=> b!396906 (= res!227826 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11635 _keys!709))))))

(declare-fun b!396907 () Bool)

(declare-fun res!227820 () Bool)

(assert (=> b!396907 (=> (not res!227820) (not e!240100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396907 (= res!227820 (validMask!0 mask!1025))))

(assert (= (and start!38450 res!227818) b!396907))

(assert (= (and b!396907 res!227820) b!396898))

(assert (= (and b!396898 res!227817) b!396904))

(assert (= (and b!396904 res!227824) b!396905))

(assert (= (and b!396905 res!227823) b!396906))

(assert (= (and b!396906 res!227826) b!396896))

(assert (= (and b!396896 res!227825) b!396897))

(assert (= (and b!396897 res!227819) b!396899))

(assert (= (and b!396899 res!227821) b!396895))

(assert (= (and b!396895 res!227822) b!396900))

(assert (= (and b!396903 condMapEmpty!16446) mapIsEmpty!16446))

(assert (= (and b!396903 (not condMapEmpty!16446)) mapNonEmpty!16446))

(get-info :version)

(assert (= (and mapNonEmpty!16446 ((_ is ValueCellFull!4598) mapValue!16446)) b!396902))

(assert (= (and b!396903 ((_ is ValueCellFull!4598) mapDefault!16446)) b!396901))

(assert (= start!38450 b!396903))

(declare-fun m!392613 () Bool)

(assert (=> b!396904 m!392613))

(declare-fun m!392615 () Bool)

(assert (=> b!396907 m!392615))

(declare-fun m!392617 () Bool)

(assert (=> b!396900 m!392617))

(declare-fun m!392619 () Bool)

(assert (=> start!38450 m!392619))

(declare-fun m!392621 () Bool)

(assert (=> start!38450 m!392621))

(declare-fun m!392623 () Bool)

(assert (=> b!396897 m!392623))

(declare-fun m!392625 () Bool)

(assert (=> b!396896 m!392625))

(declare-fun m!392627 () Bool)

(assert (=> b!396899 m!392627))

(declare-fun m!392629 () Bool)

(assert (=> b!396895 m!392629))

(declare-fun m!392631 () Bool)

(assert (=> b!396895 m!392631))

(declare-fun m!392633 () Bool)

(assert (=> mapNonEmpty!16446 m!392633))

(declare-fun m!392635 () Bool)

(assert (=> b!396905 m!392635))

(check-sat (not b!396905) (not b!396907) tp_is_empty!9883 (not b!396896) (not start!38450) (not b!396895) (not b!396900) (not mapNonEmpty!16446) (not b!396899) (not b!396904))
(check-sat)
