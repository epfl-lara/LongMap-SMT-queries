; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37518 () Bool)

(assert start!37518)

(declare-fun b_free!8659 () Bool)

(declare-fun b_next!8659 () Bool)

(assert (=> start!37518 (= b_free!8659 (not b_next!8659))))

(declare-fun tp!30692 () Bool)

(declare-fun b_and!15875 () Bool)

(assert (=> start!37518 (= tp!30692 b_and!15875)))

(declare-fun b!382845 () Bool)

(declare-fun e!232567 () Bool)

(declare-fun e!232571 () Bool)

(assert (=> b!382845 (= e!232567 (not e!232571))))

(declare-fun res!217927 () Bool)

(assert (=> b!382845 (=> res!217927 e!232571)))

(declare-fun lt!179636 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382845 (= res!217927 (or (and (not lt!179636) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179636) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179636)))))

(assert (=> b!382845 (= lt!179636 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!13515 0))(
  ( (V!13516 (val!4698 Int)) )
))
(declare-datatypes ((ValueCell!4310 0))(
  ( (ValueCellFull!4310 (v!6889 V!13515)) (EmptyCell!4310) )
))
(declare-datatypes ((array!22507 0))(
  ( (array!22508 (arr!10722 (Array (_ BitVec 32) ValueCell!4310)) (size!11075 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22507)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6296 0))(
  ( (tuple2!6297 (_1!3159 (_ BitVec 64)) (_2!3159 V!13515)) )
))
(declare-datatypes ((List!6122 0))(
  ( (Nil!6119) (Cons!6118 (h!6974 tuple2!6296) (t!11263 List!6122)) )
))
(declare-datatypes ((ListLongMap!5199 0))(
  ( (ListLongMap!5200 (toList!2615 List!6122)) )
))
(declare-fun lt!179630 () ListLongMap!5199)

(declare-fun zeroValue!472 () V!13515)

(declare-datatypes ((array!22509 0))(
  ( (array!22510 (arr!10723 (Array (_ BitVec 32) (_ BitVec 64))) (size!11076 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22509)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13515)

(declare-fun getCurrentListMap!1998 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5199)

(assert (=> b!382845 (= lt!179630 (getCurrentListMap!1998 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179627 () array!22507)

(declare-fun lt!179632 () ListLongMap!5199)

(declare-fun lt!179633 () array!22509)

(assert (=> b!382845 (= lt!179632 (getCurrentListMap!1998 lt!179633 lt!179627 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179628 () ListLongMap!5199)

(declare-fun lt!179629 () ListLongMap!5199)

(assert (=> b!382845 (and (= lt!179628 lt!179629) (= lt!179629 lt!179628))))

(declare-fun lt!179634 () ListLongMap!5199)

(declare-fun lt!179631 () tuple2!6296)

(declare-fun +!972 (ListLongMap!5199 tuple2!6296) ListLongMap!5199)

(assert (=> b!382845 (= lt!179629 (+!972 lt!179634 lt!179631))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13515)

(assert (=> b!382845 (= lt!179631 (tuple2!6297 k0!778 v!373))))

(declare-datatypes ((Unit!11802 0))(
  ( (Unit!11803) )
))
(declare-fun lt!179635 () Unit!11802)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!191 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) (_ BitVec 64) V!13515 (_ BitVec 32) Int) Unit!11802)

(assert (=> b!382845 (= lt!179635 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!191 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!863 (array!22509 array!22507 (_ BitVec 32) (_ BitVec 32) V!13515 V!13515 (_ BitVec 32) Int) ListLongMap!5199)

(assert (=> b!382845 (= lt!179628 (getCurrentListMapNoExtraKeys!863 lt!179633 lt!179627 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382845 (= lt!179627 (array!22508 (store (arr!10722 _values!506) i!548 (ValueCellFull!4310 v!373)) (size!11075 _values!506)))))

(assert (=> b!382845 (= lt!179634 (getCurrentListMapNoExtraKeys!863 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382846 () Bool)

(declare-fun res!217931 () Bool)

(declare-fun e!232570 () Bool)

(assert (=> b!382846 (=> (not res!217931) (not e!232570))))

(declare-fun arrayContainsKey!0 (array!22509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382846 (= res!217931 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382847 () Bool)

(declare-fun res!217930 () Bool)

(assert (=> b!382847 (=> (not res!217930) (not e!232570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382847 (= res!217930 (validKeyInArray!0 k0!778))))

(declare-fun b!382848 () Bool)

(declare-fun res!217929 () Bool)

(assert (=> b!382848 (=> (not res!217929) (not e!232570))))

(assert (=> b!382848 (= res!217929 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11076 _keys!658))))))

(declare-fun b!382849 () Bool)

(declare-fun res!217934 () Bool)

(assert (=> b!382849 (=> (not res!217934) (not e!232570))))

(assert (=> b!382849 (= res!217934 (and (= (size!11075 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11076 _keys!658) (size!11075 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!217928 () Bool)

(assert (=> start!37518 (=> (not res!217928) (not e!232570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37518 (= res!217928 (validMask!0 mask!970))))

(assert (=> start!37518 e!232570))

(declare-fun e!232568 () Bool)

(declare-fun array_inv!7896 (array!22507) Bool)

(assert (=> start!37518 (and (array_inv!7896 _values!506) e!232568)))

(assert (=> start!37518 tp!30692))

(assert (=> start!37518 true))

(declare-fun tp_is_empty!9307 () Bool)

(assert (=> start!37518 tp_is_empty!9307))

(declare-fun array_inv!7897 (array!22509) Bool)

(assert (=> start!37518 (array_inv!7897 _keys!658)))

(declare-fun b!382850 () Bool)

(declare-fun res!217933 () Bool)

(assert (=> b!382850 (=> (not res!217933) (not e!232567))))

(declare-datatypes ((List!6123 0))(
  ( (Nil!6120) (Cons!6119 (h!6975 (_ BitVec 64)) (t!11264 List!6123)) )
))
(declare-fun arrayNoDuplicates!0 (array!22509 (_ BitVec 32) List!6123) Bool)

(assert (=> b!382850 (= res!217933 (arrayNoDuplicates!0 lt!179633 #b00000000000000000000000000000000 Nil!6120))))

(declare-fun b!382851 () Bool)

(declare-fun res!217937 () Bool)

(assert (=> b!382851 (=> (not res!217937) (not e!232570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22509 (_ BitVec 32)) Bool)

(assert (=> b!382851 (= res!217937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382852 () Bool)

(declare-fun e!232566 () Bool)

(declare-fun mapRes!15525 () Bool)

(assert (=> b!382852 (= e!232568 (and e!232566 mapRes!15525))))

(declare-fun condMapEmpty!15525 () Bool)

(declare-fun mapDefault!15525 () ValueCell!4310)

(assert (=> b!382852 (= condMapEmpty!15525 (= (arr!10722 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4310)) mapDefault!15525)))))

(declare-fun b!382853 () Bool)

(assert (=> b!382853 (= e!232566 tp_is_empty!9307)))

(declare-fun b!382854 () Bool)

(declare-fun res!217932 () Bool)

(assert (=> b!382854 (=> (not res!217932) (not e!232570))))

(assert (=> b!382854 (= res!217932 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6120))))

(declare-fun b!382855 () Bool)

(assert (=> b!382855 (= e!232570 e!232567)))

(declare-fun res!217935 () Bool)

(assert (=> b!382855 (=> (not res!217935) (not e!232567))))

(assert (=> b!382855 (= res!217935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179633 mask!970))))

(assert (=> b!382855 (= lt!179633 (array!22510 (store (arr!10723 _keys!658) i!548 k0!778) (size!11076 _keys!658)))))

(declare-fun b!382856 () Bool)

(assert (=> b!382856 (= e!232571 true)))

(declare-fun lt!179637 () ListLongMap!5199)

(assert (=> b!382856 (= lt!179637 (+!972 lt!179630 lt!179631))))

(assert (=> b!382856 (= lt!179632 lt!179628)))

(declare-fun mapNonEmpty!15525 () Bool)

(declare-fun tp!30693 () Bool)

(declare-fun e!232565 () Bool)

(assert (=> mapNonEmpty!15525 (= mapRes!15525 (and tp!30693 e!232565))))

(declare-fun mapKey!15525 () (_ BitVec 32))

(declare-fun mapRest!15525 () (Array (_ BitVec 32) ValueCell!4310))

(declare-fun mapValue!15525 () ValueCell!4310)

(assert (=> mapNonEmpty!15525 (= (arr!10722 _values!506) (store mapRest!15525 mapKey!15525 mapValue!15525))))

(declare-fun mapIsEmpty!15525 () Bool)

(assert (=> mapIsEmpty!15525 mapRes!15525))

(declare-fun b!382857 () Bool)

(declare-fun res!217936 () Bool)

(assert (=> b!382857 (=> (not res!217936) (not e!232570))))

(assert (=> b!382857 (= res!217936 (or (= (select (arr!10723 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10723 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382858 () Bool)

(assert (=> b!382858 (= e!232565 tp_is_empty!9307)))

(assert (= (and start!37518 res!217928) b!382849))

(assert (= (and b!382849 res!217934) b!382851))

(assert (= (and b!382851 res!217937) b!382854))

(assert (= (and b!382854 res!217932) b!382848))

(assert (= (and b!382848 res!217929) b!382847))

(assert (= (and b!382847 res!217930) b!382857))

(assert (= (and b!382857 res!217936) b!382846))

(assert (= (and b!382846 res!217931) b!382855))

(assert (= (and b!382855 res!217935) b!382850))

(assert (= (and b!382850 res!217933) b!382845))

(assert (= (and b!382845 (not res!217927)) b!382856))

(assert (= (and b!382852 condMapEmpty!15525) mapIsEmpty!15525))

(assert (= (and b!382852 (not condMapEmpty!15525)) mapNonEmpty!15525))

(get-info :version)

(assert (= (and mapNonEmpty!15525 ((_ is ValueCellFull!4310) mapValue!15525)) b!382858))

(assert (= (and b!382852 ((_ is ValueCellFull!4310) mapDefault!15525)) b!382853))

(assert (= start!37518 b!382852))

(declare-fun m!379151 () Bool)

(assert (=> b!382855 m!379151))

(declare-fun m!379153 () Bool)

(assert (=> b!382855 m!379153))

(declare-fun m!379155 () Bool)

(assert (=> b!382857 m!379155))

(declare-fun m!379157 () Bool)

(assert (=> b!382854 m!379157))

(declare-fun m!379159 () Bool)

(assert (=> mapNonEmpty!15525 m!379159))

(declare-fun m!379161 () Bool)

(assert (=> b!382847 m!379161))

(declare-fun m!379163 () Bool)

(assert (=> b!382851 m!379163))

(declare-fun m!379165 () Bool)

(assert (=> b!382846 m!379165))

(declare-fun m!379167 () Bool)

(assert (=> b!382850 m!379167))

(declare-fun m!379169 () Bool)

(assert (=> start!37518 m!379169))

(declare-fun m!379171 () Bool)

(assert (=> start!37518 m!379171))

(declare-fun m!379173 () Bool)

(assert (=> start!37518 m!379173))

(declare-fun m!379175 () Bool)

(assert (=> b!382856 m!379175))

(declare-fun m!379177 () Bool)

(assert (=> b!382845 m!379177))

(declare-fun m!379179 () Bool)

(assert (=> b!382845 m!379179))

(declare-fun m!379181 () Bool)

(assert (=> b!382845 m!379181))

(declare-fun m!379183 () Bool)

(assert (=> b!382845 m!379183))

(declare-fun m!379185 () Bool)

(assert (=> b!382845 m!379185))

(declare-fun m!379187 () Bool)

(assert (=> b!382845 m!379187))

(declare-fun m!379189 () Bool)

(assert (=> b!382845 m!379189))

(check-sat (not b!382847) (not b!382854) b_and!15875 (not mapNonEmpty!15525) (not b!382845) (not b!382846) tp_is_empty!9307 (not start!37518) (not b!382855) (not b!382850) (not b!382851) (not b_next!8659) (not b!382856))
(check-sat b_and!15875 (not b_next!8659))
